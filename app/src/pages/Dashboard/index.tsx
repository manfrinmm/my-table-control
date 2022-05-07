import { useEffect, useState } from "react";
import { Link, useHistory } from "react-router-dom";
import { toast } from "react-toastify";

import { LogoutIcon } from "@heroicons/react/outline";

import logo from "../../assets/logo.svg";
import Loading from "../../components/Loading";
import { useAuth } from "../../hooks/auth";
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
  const { signOut } = useAuth();

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
      <div className="flex items-center mb-4">
        <img className="h-12" src={logo} alt="Workflow" />

        <div className="ml-auto">
          <button
            type="button"
            onClick={signOut}
            className="
            py-2 px-4
            border-2 border-amber-500 text-amber-200
            font-bold
            text-base
            flex items-center
            rounded-lg
          hover:bg-amber-600
          hover:text-white
            transition"
          >
            <LogoutIcon width={24} className="mr-2" />
            Sair
          </button>
        </div>
      </div>

      <header className={styles.header}>
        <button
          type="button"
          onClick={() => {
            history.push("/tables");
          }}
          className="text-white bg-amber-700 hover:bg-amber-800"
        >
          Cadastrar mesa
        </button>

        <button
          type="button"
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
          <Loading />
        ) : (
          <section className={styles.tables}>
            {tables.map(table => (
              <Link
                to={`tables?table=${table.id}`}
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
                    {table._count.presences > 0
                      ? table._count.presences - 1
                      : 0}
                    /{table.capacity}
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
