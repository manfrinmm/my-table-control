interface IDefaultLayoutProps {
  children: React.ReactNode;
}

export default function DefaultLayout({ children }: IDefaultLayoutProps) {
  return <div className="m-auto py-2 px-4 max-w-3xl">{children}</div>;
}

// export const Container = styled.div`
//   display: flex;
//   flex-direction: row;

//   margin: 16px 16px 8px;
//   border-radius: 32px;
//   padding: 8px 16px;
//   box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.2);

//   background: #3b9974;
//   min-height: 95vh;

//   color: #fff;
// `;

// export const Wrapper = styled.section`
//   border-radius: 32px;
//   width: 100%;
//   /* height: 100%; */
//   padding: 16px 8px;
//   background: #fdfeff;
//   margin-left: 16px;
//   color: #000;
// `;
