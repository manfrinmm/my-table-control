import { PlusIcon } from "@heroicons/react/outline";
import { Form } from "@unform/web";
import { useCallback, useEffect, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import { toast } from "react-toastify";
import Input from "../../components/form/Input";
import Loading from "../../components/Loading";

import api from "../../services/api";
import handleMessageError from "../../utils/handleMessageError";
import styles from "./styles.module.css";

const event_id = import.meta.env.VITE_EVENT_ID;

type ITableType = {
  id: number;
  number: number;
  capacity: number;
  event_id: number;
  presences: [
    {
      person_name: string;
    },
  ];
  _count: {
    presences: number;
  };
};

export default function Dashboard() {
  const history = useHistory();
  const [tables, setTables] = useState<ITableType[]>([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    async function loadTables() {
      try {
        const response = await api.get(`/events/${event_id}/tables`);

        setTables(response.data);
      } catch (error) {
        toast.error(`Erro ao carregar mesas. ${handleMessageError(error)}`);
      } finally {
        setIsLoading(false);
      }
    }

    loadTables();
  }, []);

  return (
    <div className="flex flex-col">
      <header className={styles.header}>
        <button
          onClick={() => {
            history.push("/tables");
          }}
          className="text-white bg-amber-700 hover:bg-amber-800"
        >
          Cadastrar mesa
        </button>

        <button
          className="text-amber-700 border border-amber-700 hover:bg-amber-800 hover:text-white"
          onClick={() => {
            history.push("/presences");
          }}
        >
          Presenças
        </button>
      </header>

      <main>
        <h2 className="m-4 text-2xl text-center">Cadastro de mesas</h2>

        {isLoading ? (
          <Loading className="" />
        ) : (
          <section className={styles.tables}>
            {tables.map((table) => (
              <Link
                to={`tables/${table.id}`}
                className={styles.table}
                key={table.id}
              >
                <div>
                  <span>Mesa: </span>
                  <strong>{table.number}</strong>
                </div>

                <div>
                  <span>Convidado: </span>
                  <strong>{table.presences[0]?.person_name || "-"}</strong>
                </div>

                <div>
                  <span>Acompanhantes: </span>
                  <strong>
                    {table._count.presences}/{table.capacity}
                  </strong>
                </div>
              </Link>
            ))}
          </section>
        )}
      </main>
    </div>
  );
}
