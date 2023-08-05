export function TabMenu() {
  return (
    <div className='mx-auto max-w-[1200px] flex justify-between bg-red-300'>
      <div>
        <p>Não encontrou seu duo</p>
        <p>Publique um anúncio para encontrar novos players</p>
      </div>
  
      <div className='flex justify-between'>
        <button>Entrar com discord</button>
        <button>Publicar anúncio</button>
      </div>
    </div>
  );
}
