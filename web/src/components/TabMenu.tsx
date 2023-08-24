'use client'
import Image from 'next/image'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faArrowRightFromBracket } from '@fortawesome/free-solid-svg-icons'
import { faDiscord } from '@fortawesome/free-brands-svg-icons'
import { useAuth } from '../contexts/auth'
import { CreateAdButton } from './AdButtonModal'

export function TabMenu() {
  const { login, logout, isAuthenticated, user } = useAuth()

  return (
    <div className='mx-auto px-8 py-6 max-w-[1200px] h-[112px] flex items-center justify-between rounded-lg bg-[#2A2634] tabmenu-gradient'>
      <div className='flex flex-col gap-1'>
        <p className='font-black text-2xl'>Não encontrou seu duo?</p>
        <p className='text-zinc-400'>Publique um anúncio para encontrar novos players</p>
      </div>
  
      <div className='flex justify-between gap-6'>
        {isAuthenticated && user ? (
          <button
            onClick={logout}
            className='cursor-pointer py-1 pr-1 pl-4 flex items-center gap-3 font-medium bg-zinc-500 hover:bg-zinc-600 transition-all ease-in-out duration-500 rounded-[6px_30px_30px_6px]'
          >
            <FontAwesomeIcon icon={faArrowRightFromBracket} rotation={180} className='h-[22px]'/>
            {user.username}
            {user.avatar ? (
              <Image
                src={user.avatar}
                alt={'Avatar Discord'}
                className='rounded-full'
                width={42}
                height={42}
                quality={100}
                unoptimized={true}
                priority
              />
            ) : (
              <Image
                src={`https://cdn.discordapp.com/embed/avatars/${Math.abs((Number(user?.id) >> 22) % 6)}.png`}
                alt={'Avatar Discord'}
                className='rounded-full'
                width={42}
                height={42}
                quality={100}
                unoptimized={true}
                priority
              />
            )}
          </button>
        ) : (
          <button
            onClick={login}
            id = 'discordLogin'
            className='cursor-pointer px-4 py-3 flex items-center gap-3 font-medium bg-overwatch-default hover:bg-overwatch-hover transition-all ease-in-out duration-500 rounded-md'
          >
            <FontAwesomeIcon icon={faDiscord} className='h-[22px]'/>
            Entrar com discord
          </button>
        )}
        

        {isAuthenticated && (
          <CreateAdButton />
        )}
      </div>
    </div>
  );
}
