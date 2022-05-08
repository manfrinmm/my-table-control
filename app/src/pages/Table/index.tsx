import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { Link, useLocation } from "react-router-dom";
import { toast } from "react-toastify";

import { ChevronLeftIcon, PlusIcon, TrashIcon } from "@heroicons/react/outline";
import { FormHandles } from "@unform/core";
import { Form } from "@unform/web";

import Input from "../../components/form/Input";
import ReactSelect from "../../components/form/ReactSelect";
import Loading from "../../components/Loading";
import api from "../../services/api";
import handleMessageError from "../../utils/handleMessageError";
import styles from "./styles.module.css";

const event_id = import.meta.env.VITE_EVENT_ID;

type ITableType = {
  id: number;
  capacity: number;
  number: number;
};

type ITablesOptionType = {
  label: string;
  value: number;
};

type IPersonType = {
  id?: number;
  person_name: string;
  type: "Convidado" | "Acompanhante";
};

export default function Table() {
  const location = useLocation();

  const tableQuery = Number(location.search.split("=")[1]) || null;

  const [convidados, setConvidados] = useState<IPersonType[]>([]);
  const [acompanhantes, setAcompanhantes] = useState<IPersonType[]>([]);
  const [tables, setTables] = useState<ITablesOptionType[]>([]);
  const [tableCapacity, setTableCapacity] = useState(0);
  const [loading, setLoading] = useState(true);

  const formRef = useRef<FormHandles>(null);
  const tableCapacityUsage = useMemo(() => {
    return acompanhantes.length + convidados.length;
  }, [acompanhantes, convidados]);

  const loadTableData = useCallback(async (table_id: number) => {
    setLoading(true);

    try {
      const response = await api.get(`/events/${event_id}/tables/${table_id}`);

      setTableCapacity(response.data.capacity);
      formRef.current?.setFieldValue("capacity", response.data.capacity);

      const { presences } = response.data;
      const convidadoPresences = presences.filter(
        (presence: any) => presence.type === "Convidado",
      );
      const acompanhantePresences = presences.filter(
        (presence: any) => presence.type !== "Convidado",
      );

      setConvidados(convidadoPresences);
      setAcompanhantes(acompanhantePresences);
    } catch (error) {
      toast.error("Não foi possível carregar essas informações");
    }

    setLoading(false);
  }, []);

  useEffect(() => {
    async function loadTables() {
      let loadingContinue = true;
      try {
        const response = await api.get(`/events/${event_id}/tables`);

        setTables(
          response.data.map((tableOption: any) => ({
            label: tableOption.number,
            value: tableOption.id,
          })),
        );

        if (tableQuery) {
          const tableData = response.data.find(
            (tableItem: ITableType) => tableItem.id === tableQuery,
          ) as ITableType;

          formRef.current?.setFieldValue("table", {
            label: String(tableData.number),
            value: tableData.id,
          });
          formRef.current?.setFieldValue("capacity", tableData.capacity);
        } else {
          loadingContinue = false;
        }
      } catch (error) {
        toast.error(`Erro ao carregar mesas. ${handleMessageError(error)}`);
      }
      setLoading(loadingContinue);
    }

    loadTables();
  }, [tableQuery]);

  const handleSubmit = useCallback(async () => {
    const table_id = formRef.current?.getFieldValue("table");
    const capacity = formRef.current?.getFieldValue("capacity");

    const persons = convidados.filter(convidado => !convidado.id);
    persons.push(...acompanhantes.filter(acompanhante => !acompanhante.id));

    try {
      await api.post(`/events/${event_id}/tables/${table_id}`, {
        capacity,
        persons,
      });

      toast.success("Mesa atualizada com sucesso!");

      setConvidados([]);
      setAcompanhantes([]);
      setTableCapacity(0);
      formRef.current?.reset();
    } catch (error) {
      toast.error(`Erro ao cadastrar mesa. ${handleMessageError(error)}`);
    }
  }, [convidados, acompanhantes]);

  const handleAddName = useCallback((type: "convidado" | "acompanhante") => {
    const name = formRef.current?.getFieldValue(type) as string | undefined;

    if (!name) {
      return;
    }

    if (type === "convidado") {
      setConvidados(state => [
        { person_name: name, type: "Convidado" },
        ...state,
      ]);
    } else {
      setAcompanhantes(state => [
        { person_name: name, type: "Acompanhante" },
        ...state,
      ]);
    }

    formRef.current?.setFieldValue(type, "");
  }, []);

  const handleRemoveName = useCallback(
    async (type: "convidado" | "acompanhante", name?: string, id?: number) => {
      const toastId = "TOAST_REMOVE_PRESENCE";

      try {
        if (id) {
          toast.warning(`Removendo ${type}`, {
            toastId,
            autoClose: false,
          });

          await api.delete(`/events/${event_id}/tables/2/presences/${id}`);

          toast.update(toastId, {
            render: `O ${type} foi removido`,
            type: "success",
            autoClose: 5000,
          });
        }

        if (type === "convidado") {
          setConvidados(state =>
            state.filter(person => person.person_name !== name),
          );
        } else {
          setAcompanhantes(state =>
            state.filter(person => person.person_name !== name),
          );
        }
      } catch (error) {
        toast.update(toastId, {
          render: `Erro ao remover ${type}. ${handleMessageError(error)}`,
          type: "error",
          autoClose: 5000,
        });
      }
    },
    [],
  );

  return (
    <div className="flex flex-col">
      <header className="mr-auto">
        <Link
          to="/dashboard"
          className="
            p-2
            border-2 border-amber-500 text-amber-200
            font-bold
            text-base
            flex items-center
            rounded-lg
          hover:bg-amber-600
          hover:text-white
            transition
            mb-4
            "
        >
          <ChevronLeftIcon width={20} />
          <p>Voltar</p>
        </Link>
      </header>

      <main>
        <Form onSubmit={handleSubmit} ref={formRef}>
          <section className={styles.field}>
            <h2>Mesa</h2>
            <div className="flex space-x-8">
              <ReactSelect
                label="Mesa"
                name="table"
                placeholder="Selecione uma mesa"
                options={tables}
                noOptionsMessage={() => "Nenhuma mesa encontrada"}
                onChange={(data: any, event) => {
                  if (data) {
                    loadTableData(data.value);
                  }
                }}
                className="min-w-fit"
              />

              <Input
                label="Capacidade da mesa"
                name="capacity"
                placeholder="Digite a capacidade"
                required
                type="number"
                className="w-min"
                min={1}
                containerStyle={tableCapacity > 0 ? "" : "opacity-0"}
                onKeyDown={event => {
                  if (event.key === "Enter") {
                    event.preventDefault();
                  }
                }}
              />
            </div>
          </section>

          {!tableCapacity && !loading && (
            <h2 className="text-3xl text-center">Selecione uma mesa</h2>
          )}

          {loading ? (
            <Loading />
          ) : (
            !!tableCapacity && (
              <>
                <section className={styles.field}>
                  <h2>Dados</h2>
                  <section className="flex justify-between text-xl text-center">
                    <div>
                      <p>Capacidade</p>
                      <strong>{tableCapacity}</strong>
                    </div>

                    <div>
                      <p>Disponibilidade </p>
                      <strong>{tableCapacity - tableCapacityUsage}</strong>
                    </div>

                    <div>
                      <p>Ocupado </p>
                      <strong>{tableCapacityUsage}</strong>
                    </div>
                  </section>
                </section>
                <section className={styles.field}>
                  <h2>Convidado</h2>
                  {!(tableCapacity <= tableCapacityUsage) && (
                    <>
                      <Input
                        label="Nome do convidado"
                        name="convidado"
                        placeholder="Digite o nome completo"
                        enterKeyHint="done"
                        autoCapitalize="words"
                        onKeyDown={event => {
                          if (event.key === "Enter") {
                            event.preventDefault();

                            handleAddName("convidado");
                          }
                        }}
                      />

                      <button
                        type="button"
                        onClick={() => {
                          handleAddName("convidado");
                        }}
                      >
                        <PlusIcon className="w-7 h-7 mr-1" />
                        <p>Adicionar</p>
                      </button>
                    </>
                  )}

                  <div className="space-y-2">
                    {convidados.map(convidado => (
                      <div className={styles.person} key={`${Math.random()}`}>
                        <p>{convidado.person_name}</p>

                        <button
                          type="button"
                          onClick={() => {
                            handleRemoveName(
                              "convidado",
                              convidado.person_name,
                              convidado.id,
                            );
                          }}
                        >
                          <TrashIcon className="w-5 h-5 mr-1" /> Remover
                        </button>
                      </div>
                    ))}
                  </div>
                </section>

                <section className={styles.field}>
                  <h2>Acompanhantes</h2>
                  {!(tableCapacity <= tableCapacityUsage) && (
                    <>
                      <Input
                        label="Nome do acompanhante"
                        name="acompanhante"
                        placeholder="Digite o nome completo"
                        onKeyDown={event => {
                          if (event.key === "Enter") {
                            event.preventDefault();

                            handleAddName("acompanhante");
                          }
                        }}
                        enterKeyHint="done"
                        autoCapitalize="words"
                      />

                      <button
                        type="button"
                        onClick={() => {
                          handleAddName("acompanhante");
                        }}
                      >
                        <PlusIcon className="w-7 h-7 mr-1" />
                        <p>Adicionar</p>
                      </button>
                    </>
                  )}

                  <div className="space-y-2">
                    {acompanhantes.map(acompanhante => (
                      <div className={styles.person} key={`${Math.random()}`}>
                        <p>{acompanhante.person_name}</p>

                        <button
                          type="button"
                          onClick={() => {
                            handleRemoveName(
                              "acompanhante",
                              acompanhante.person_name,
                              acompanhante.id,
                            );
                          }}
                        >
                          <TrashIcon className="w-5 h-5 mr-1" /> Remover
                        </button>
                      </div>
                    ))}
                  </div>
                </section>

                <button
                  type="submit"
                  className="w-full py-2 px-4 mt-4 text-xl font-medium rounded-md text-white bg-amber-700 hover:bg-amber-800"
                >
                  Atualizar
                </button>
              </>
            )
          )}
        </Form>
      </main>
    </div>
  );
}
