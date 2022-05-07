import { useCallback, useRef, useState } from "react";
import { Link } from "react-router-dom";
import { toast } from "react-toastify";

import { ChevronLeftIcon } from "@heroicons/react/outline";
import { FormHandles } from "@unform/core";
import { Form } from "@unform/web";

import Input from "../../components/form/Input";
import Loading from "../../components/Loading";
import Modal from "../../components/Modal";
import api from "../../services/api";
import formatDate from "../../utils/formatDate";
import handleMessageError from "../../utils/handleMessageError";
import styles from "./styles.module.css";

type IPresenceType = {
  id: number;
  person_name: string;
  table: { number: number };
  type: "Acompanhante" | "Convidado";
  arrived_at?: string;
};

const event_id = import.meta.env.VITE_EVENT_ID;

export default function Presences() {
  const [presences, setPresences] = useState<IPresenceType[]>([]);
  const [presenceId, setPresenceId] = useState(0);
  const [isLoading, setIsLoading] = useState(false);

  const [modalIsOpen, setModalIsOpen] = useState(false);

  const formRef = useRef<FormHandles>(null);

  const handleModalPresenceConfirmation = useCallback(
    async (presence: IPresenceType) => {
      setModalIsOpen(true);
      setPresenceId(presence.id);
    },
    [],
  );

  const handleSetPresenceConfirmation = useCallback(async () => {
    try {
      const response = await api.put(
        `/events/${event_id}/presences/${presenceId}`,
      );

      toast.success("Presença confirmada!", {
        toastId: "PRESENCE_CONFIRMATION",
      });
      setModalIsOpen(false);
      setPresenceId(0);
      setPresences(state =>
        state.map(presence => {
          if (presence.id === presenceId) {
            return { ...presence, arrived_at: response.data.arrived_at };
          }

          return presence;
        }),
      );
    } catch (error) {
      toast.error(`Erro ao confirmar presença! ${handleMessageError(error)}`);
    }
  }, [presenceId]);

  const handleSubmit = useCallback(async (data: any) => {
    setIsLoading(true);
    setPresences([]);

    try {
      const response = await api.get(`/events/${event_id}/presences`, {
        params: data,
      });

      setPresences(response.data);

      (formRef.current?.getFieldRef("search") as HTMLInputElement).blur();
    } catch (error) {
      toast.error(`${handleMessageError(error)}`);
    } finally {
      setIsLoading(false);
    }
  }, []);

  return (
    <div className="flex flex-col">
      <header className="flex flex-col">
        {/* <Link to="/dashboard" className="flex items-center mb-4"> */}
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
            mr-auto
            mb-4
            "
        >
          <ChevronLeftIcon width={20} />
          <p>Voltar</p>
        </Link>

        <Form onSubmit={handleSubmit} ref={formRef}>
          <Input
            label="Campo de busca"
            name="search"
            type="search"
            placeholder="Pesquisa por Nome ou Mesa"
            required
            className="text-lg"
          />

          <button
            type="button"
            className="w-full py-2 px-4 mt-4 border border-transparent text-xl font-medium rounded-md text-white bg-amber-700 hover:bg-amber-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-amber-500"
          >
            Buscar
          </button>
        </Form>
      </header>

      <main className="flex flex-col text-center mt-16">
        {isLoading ? (
          <Loading />
        ) : (
          <section className={styles.presences}>
            {presences.map(presence => (
              <button
                type="button"
                key={presence.id}
                // className={styles.presence}
                className={`flex flex-col justify-center bg-zinc-800 rounded-lg p-2 disabled:bg-zinc-900 ${styles.presence}`}
                onClick={() => {
                  handleModalPresenceConfirmation(presence);
                }}
                disabled={!!presence.arrived_at}
              >
                <p className="font-semibold text-lg">{presence.person_name}</p>

                <div className="flex justify-around w-full">
                  <div className="flex items-center">
                    <span>Mesa:</span>
                    <strong> {presence.table.number}</strong>
                  </div>

                  <div className="flex items-center">
                    <span>Tipo:</span>
                    <strong> {presence.type}</strong>
                  </div>

                  <div className="flex items-center">
                    <span>Status:</span>
                    <strong>
                      {presence.arrived_at ? (
                        <p className="flex flex-col text-center">
                          <span>Chegou as</span>
                          <span>{formatDate(presence.arrived_at, true)}</span>
                        </p>
                      ) : (
                        "Ausente"
                      )}
                    </strong>
                  </div>
                </div>
              </button>
            ))}
          </section>
        )}
      </main>

      <Modal
        isOpen={modalIsOpen}
        shouldCloseOnOverlayClick
        onRequestClose={() => {
          setModalIsOpen(false);
        }}
      >
        <div className="bg-stone-800 p-4 w-96 rounded-lg flex flex-col items-center ">
          <p className="text-lg">Marcar presença para</p>
          <strong className="text-lg">Matheus MM</strong>
          <p>
            <span>Mesa:</span> <strong>1</strong>
          </p>
          <strong>Convidado</strong>

          <button
            type="button"
            className="mt-4 w-full bg-amber-700 p-2 rounded-lg font-semibold hover:bg-amber-800 transition"
            onClick={handleSetPresenceConfirmation}
          >
            Marcar Presença
          </button>
          <button
            type="button"
            className="mt-6 bg-stone-700 p-2 rounded text-stone-200"
            onClick={() => {
              setModalIsOpen(false);
            }}
          >
            Cancelar
          </button>
        </div>
      </Modal>
    </div>
  );
}
