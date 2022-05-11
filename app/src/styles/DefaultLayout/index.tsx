interface IDefaultLayoutProps {
  children: React.ReactNode;
}

export default function DefaultLayout({ children }: IDefaultLayoutProps) {
  return (
    <div className="flex flex-col m-auto py-2 px-4 max-w-3xl h-full">
      {children}

      <footer className="mt-auto py-2 ">
        <p>
          Made By Matheus Manfrin -{" "}
          <a
            href="https://api.whatsapp.com/send?phone=556496140384&text=Ol%C3%A1,%20vim%20pelo%20MYTC."
            target="_blank"
            rel="noreferrer"
          >
            (64) 9 9614-0384
          </a>
        </p>
      </footer>
    </div>
  );
}
