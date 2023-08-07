import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faSquarePlus } from '@fortawesome/free-solid-svg-icons'
import { faDiscord } from '@fortawesome/free-brands-svg-icons'

export function TabMenu() {
  return (
    <div className='mx-auto px-8 py-6 max-w-[1200px] h-[112px] flex items-center justify-between rounded-lg bg-[#2A2634] tabmenu-gradient'>
      <div className='flex flex-col gap-1'>
        <p className='font-black text-2xl'>Não encontrou seu duo?</p>
        <p className='text-zinc-400'>Publique um anúncio para encontrar novos players</p>
      </div>
  
      <div className='flex justify-between gap-6'>
        <button className='cursor-pointer px-4 py-3 flex items-center gap-3 font-medium bg-overwatch-default hover:bg-overwatch-hover transition-all ease-in-out duration-500 rounded-md'>
          <FontAwesomeIcon icon={faDiscord} width={28} />
          Entrar com discord
        </button>
        <button className='cursor-pointer px-4 py-3 flex items-center gap-3 font-medium bg-overwatch-default hover:bg-overwatch-hover transition-all ease-in-out duration-500 rounded-md'>
          <FontAwesomeIcon icon={faSquarePlus} width={24} />
          Publicar anúncio
        </button>
      </div>
    </div>
  );
}
