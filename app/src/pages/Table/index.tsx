import { ChevronLeftIcon, PlusIcon, TrashIcon } from "@heroicons/react/outline";
import { FormHandles } from "@unform/core";
import { Form } from "@unform/web";
import { useCallback, useEffect, useRef, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import { toast } from "react-toastify";
import Input from "../../components/form/Input";
import ReactSelect from "../../components/form/ReactSelect";

import api from "../../services/api";
import handleMessageError from "../../utils/handleMessageError";
import styles from "./styles.module.css";

const event_id = import.meta.env.VITE_EVENT_ID;

export default function Table() {
  const history = useHistory();
  const [convidado, setConvidado] = useState("");
  const [acompanhantes, setAcompanhantes] = useState<string[]>([]);
  const [tables, setTables] = useState<any>([]);

  const formRef = useRef<FormHandles>(null);

  useEffect(() => {
    async function loadTables() {
      try {
        const response = await api.get(`/events/${event_id}/tables`);

        // setTables(response.data);
        setTables(
          response.data.map((table: any) => ({
            label: table.number,
            value: table.id,
          })),
        );
      } catch (error) {
        toast.error(`Erro ao carregar mesas. ${handleMessageError(error)}`);
      } finally {
      }
    }

    loadTables();
  }, []);

  const handleSubmit = useCallback(() => {}, [convidado, acompanhantes]);

  const handleRegisterTable = useCallback(() => {
    var name = formRef.current?.getFieldValue("table");
    console.log({ name });

    formRef.current?.setFieldValue("table", [{ label: 5, value: 18 }]);
    const ref = formRef.current?.getFieldRef("table");

    var name = formRef.current?.getFieldValue("table");
    console.log({ name });
    console.log({ ref });
  }, [convidado, acompanhantes]);

  const handleAddName = useCallback((type: "convidado" | "acompanhante") => {
    const name = formRef.current?.getFieldValue(type) as string;

    if (!name) {
      return;
    }

    if (type === "convidado") {
      setConvidado(name);
    } else {
      setAcompanhantes((state) => [name, ...state]);
    }

    formRef.current?.setFieldValue(type, "");
  }, []);

  const handleRemoveName = useCallback(
    (type: "convidado" | "acompanhante", name?: string) => {
      if (type === "convidado") {
        setConvidado("");
      } else {
        setAcompanhantes((state) => state.filter((person) => person !== name));
      }
    },
    [convidado, acompanhantes],
  );

  return (
    <div className="flex flex-col">
      <header className={styles.header}>
        <Link to="/dashboard" className="flex items-center mb-4">
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
              // defaultValue={20}
            />
          </section>

          <section className={styles.field}>
            <h2>Convidado</h2>
            {!convidado && (
              <>
                <Input
                  label="Nome do convidado"
                  name="convidado"
                  placeholder="Digite o nome completo"
                  onKeyDown={(event) => {
                    if (event.key === "Enter") {
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
                <p>{convidado}</p>

                <button
                  type="button"
                  onClick={() => {
                    handleRemoveName("convidado");
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
              onKeyDown={(event) => {
                if (event.key === "Enter") {
                  handleAddName("acompanhante");
                }
              }}
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

            <div className="spacey-4">
              {acompanhantes.map((acompanhante, index) => (
                <div className={styles.person} key={index}>
                  <p>{acompanhante}</p>

                  <button
                    type="button"
                    onClick={() => {
                      handleRemoveName("acompanhante", acompanhante);
                    }}
                  >
                    <TrashIcon className="w-5 h-5 mr-1" /> Remover
                  </button>
                </div>
              ))}
            </div>
          </section>
        </Form>

        <button
          onClick={handleRegisterTable}
          type="button"
          className="w-full py-2 px-4 mt-4 text-xl font-medium rounded-md text-white bg-amber-700 hover:bg-amber-800"
        >
          Cadastrar
        </button>
      </main>
    </div>
  );
}
