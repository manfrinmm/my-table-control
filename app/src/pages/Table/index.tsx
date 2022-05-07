import { useCallback, useEffect, useRef, useState } from "react";
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

type IPersonType = {
  id?: number;
  person_name: string;
  type: "Convidado" | "Acompanhante";
};

export default function Table() {
  const location = useLocation();

  const tableQuery = Number(location.search.split("=")[1]) || null;

  const [convidado, setConvidado] = useState<IPersonType | null>();
  const [acompanhantes, setAcompanhantes] = useState<IPersonType[]>([]);
  const [tables, setTables] = useState<any>([]);
  const [loading, setLoading] = useState(true);

  const formRef = useRef<FormHandles>(null);

  const loadTableData = useCallback(async (table_id: number) => {
    setLoading(true);

    try {
      const response = await api.get(`/events/${event_id}/tables/${table_id}`);

      const { presences } = response.data;
      const convidadoPresence = presences.find(
        (presence: any) => presence.type === "Convidado",
      );
      const acompanhantePresences = presences.filter(
        (presence: any) => presence.type !== "Convidado",
      );

      setConvidado(convidadoPresence);
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
          response.data.map((table: any) => ({
            label: table.number,
            value: table.id,
          })),
        );

        if (tableQuery) {
          const table = response.data.find(
            (tableItem: any) => tableItem.id === tableQuery,
          );

          formRef.current?.setFieldValue("table", {
            label: table.number,
            value: table.id,
          });
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

    let persons = acompanhantes.filter(acompanhante => !acompanhante.id);

    if (!convidado?.id && convidado) {
      persons = [convidado, ...persons];
    }

    if (!convidado) {
      toast.error("É necessário adicionar o nome do convidado!");
      return;
    }

    try {
      await api.post(`/events/${event_id}/tables/${table_id}`, {
        persons,
      });

      toast.success(
        `Mesa ${tableQuery ? "atualizada" : "cadastrada"} com sucesso!`,
      );
      setConvidado(null);
      setAcompanhantes([]);
      formRef.current?.reset();
    } catch (error) {
      toast.error(`Erro ao cadastrar mesa. ${handleMessageError(error)}`);
    }
  }, [tableQuery, convidado, acompanhantes]);

  const handleAddName = useCallback((type: "convidado" | "acompanhante") => {
    const name = formRef.current?.getFieldValue(type) as string;

    if (!name) {
      return;
    }

    if (type === "convidado") {
      setConvidado({
        person_name: name,
        type: "Convidado",
      });
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
          setConvidado(null);
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
            />
          </section>

          {loading ? (
            <Loading />
          ) : (
            <>
              <section className={styles.field}>
                <h2>Convidado</h2>
                {!convidado && (
                  <>
                    <Input
                      label="Nome do convidado"
                      name="convidado"
                      placeholder="Digite o nome completo"
                      required
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

                {convidado && (
                  <div className={styles.person}>
                    <p>{convidado.person_name}</p>

                    <button
                      type="button"
                      onClick={() => {
                        handleRemoveName(
                          "convidado",
                          convidado?.person_name,
                          convidado?.id,
                        );
                      }}
                    >
                      <TrashIcon className="w-5 h-5 mr-1" /> Remover
                    </button>
                  </div>
                )}
              </section>

              <section className={styles.field}>
                <h2>Acompanhantes</h2>
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
                {tableQuery ? "Atualizar" : "Cadastrar"}
              </button>
            </>
          )}
        </Form>
      </main>
    </div>
  );
}
