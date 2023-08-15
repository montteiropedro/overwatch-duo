import Image from 'next/image'
import { SubmitHandler, useForm } from 'react-hook-form';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faGamepad, faSquarePlus } from '@fortawesome/free-solid-svg-icons'
import { faSteam, faBattleNet } from '@fortawesome/free-brands-svg-icons';
import tankIcon from '../../public/classes/tank.svg'
import supportIcon from '../../public/classes/support.svg'
import damageIcon from '../../public/classes/damage.svg'
import api from '../services/api'

type TFormInputs = {
  game_mode: string;
  platform_indentification: string;
  platform: string;
  years_playing: number;
  discord_username: string;
  favorite_classes: string[];
  hour_start: number;
  hour_end: number;
  voice_channel: boolean;
}

export function CreateAdButton() {
  const { register, handleSubmit, formState: { errors } } = useForm<TFormInputs>()
  
  const submit: SubmitHandler<TFormInputs> = data => api.post("/api/v1/ads", { 'ad': data }, {
    withCredentials: true
  })

  const openModal = () => document.querySelector<HTMLDialogElement>('[data-modal]')?.showModal()
  const closeModal = () => document.querySelector<HTMLDialogElement>('[data-modal]')?.close()

  return (
    <>
      <button
        onClick={openModal}
        className='cursor-pointer px-4 py-3 flex items-center gap-3 font-medium bg-overwatch-default hover:bg-overwatch-hover transition-all ease-in-out duration-500 rounded-md'>
        <FontAwesomeIcon icon={faSquarePlus} className='h-[24px]' />
         Publicar anúncio
      </button>

      <dialog data-modal className='py-8 px-9 rounded-lg bg-shape text-white data-modal cursor-pointer backdrop:cursor-overwatch backdrop:backdrop-blur-sm backdrop:bg-black/50'>
        <h1 className='mb-8 text-3xl font-black'>Publique um anúncio</h1>

        <form onSubmit={handleSubmit(submit)}>
          <div className='flex flex-col gap-2 mb-4'>
            <label htmlFor='game_mode' className='font-semibold'>Qual o modo de jogo?</label>

            <select id='game_mode' className='px-4 py-3 h-[50px] rounded bg-zinc-900' {...register('game_mode', { required: true })}>
              <option value='unranked' className='font-mono cursor-overwatch'>Unranked</option>
              <option value='competitive' className='font-mono cursor-overwatch'>Competitive</option>
              <option value='arcade' className='font-mono cursor-overwatch'>Arcade</option>
              <option value='custom_game' className='font-mono cursor-overwatch'>Custom Game</option>
            </select>
          </div>

          <div className='flex gap-6 mb-4'>
            <div className='w-full flex flex-col gap-2'>
              <label className='font-semibold'>Plataforma</label>

              <div className='w-full h-[50px] flex items-center gap-2'>
                <input id='batlenet' type='radio' value='battle_net' className='hidden peer/batlenet' {...register('platform', { required: 'Plataforma é obrigatória' })} />
                <label htmlFor='batlenet' className='py-3 w-full h-[50px] text-sm font-semibold flex justify-center items-center gap-2 bg-zinc-900 hover:bg-overwatch-default peer-checked/batlenet:bg-overwatch-default transition-all ease-in-out duration-500 rounded'>
                  <FontAwesomeIcon icon={faBattleNet} className='h-7' />
                  Battle.net
                </label>
                
                <input id='steam' type='radio' value='steam' className='hidden peer/steam' {...register('platform', { required: 'Plataforma é obrigatória' })} />
                <label htmlFor='steam' className='py-3 w-full h-[50px] text-sm font-semibold flex justify-center items-center gap-2 bg-zinc-900 hover:bg-overwatch-default peer-checked/steam:bg-overwatch-default transition-all ease-in-out duration-500 rounded'>
                  <FontAwesomeIcon icon={faSteam} className='h-7' />
                  Steam
                </label>
              </div>

              <span className='font-semibold text-sm text-red-400'>{errors.platform?.message}</span>
            </div>

            <div className='flex flex-col gap-2'>
              <label htmlFor='platform_indentification' className='font-semibold'>Identificação na plataforma</label>

              <input id='platform_indentification' className='px-4 py-3 h-[50px] rounded bg-zinc-900' type='text' placeholder='Como te chamam na plataforma?' {...register('platform_indentification', {
                required: 'Identificação na plataforma é obrigatória' 
              })} />

              <span className='font-semibold text-sm text-red-400'>{errors.platform_indentification?.message}</span>
            </div>
          </div>

          <div className='flex gap-6 mb-4'>
            <div className='flex flex-col gap-2'>
              <label htmlFor='years_playing' className='font-semibold'>Joga há quantos anos?</label>

              <input id='years_playing' className='px-4 py-3 h-[50px] rounded bg-zinc-900' placeholder='Tudo bem ser ZERO' {...register('years_playing', {
                pattern: { value: /^[0-9]+$/g, message: 'Precisa ser número' },
                min: { value: 0, message: 'Tem que ser maios que 0' },
                max: { value: new Date().getFullYear() - 2015, message: `Jogo lançado há ${new Date().getFullYear() - 2015} anos!`},
              })} />
              
              <span className='font-semibold text-sm text-red-400'>{errors.years_playing?.message}</span>
            </div>

            <div className='flex flex-col gap-2'>
              <label htmlFor='discord_username' className='font-semibold'>Qual o seu discord?</label>

              <input id='discord_username' className='px-4 py-3 h-[50px] rounded bg-zinc-900' type='text' placeholder='Usuário' {...register('discord_username', {
                required: 'Usuário do discord é obrigatório'
              })} />
              
              <span className='font-semibold text-sm text-red-400'>{errors.discord_username?.message}</span>
            </div>
          </div>

          <div className='flex gap-6 mb-4'>
            <div className='flex-1 flex flex-col gap-2'>
              <label className='font-semibold'>Classes favoritas</label>

              <div className='flex gap-2'>
                <input id='tank' type='checkbox' value='tank' className='hidden peer/tank' {...register('favorite_classes')} />
                <label htmlFor='tank' className='py-3 w-full h-[54px] text-sm font-semibold flex justify-center items-center gap-2 bg-zinc-900 hover:bg-overwatch-default peer-checked/tank:bg-overwatch-default transition-all ease-in-out duration-500 rounded'>
                  <Image
                    src={tankIcon}
                    alt='Tank Icon'
                    width={30}
                    height={30}
                    priority
                  />
                </label>
                
                <input id='support' type='checkbox' value='support' className='hidden peer/support' {...register('favorite_classes')}/>
                <label htmlFor='support' className='py-3 w-full h-[54px] text-sm font-semibold flex justify-center items-center gap-2 bg-zinc-900 hover:bg-overwatch-default peer-checked/support:bg-overwatch-default transition-all ease-in-out duration-500 rounded'>
                  <Image
                    src={supportIcon}
                    alt='Tank Icon'
                    width={30}
                    height={30}
                    priority
                  />
                </label>

                <input id='damage' type='checkbox' value='damage' className='hidden peer/damage' {...register('favorite_classes')}/>
                <label htmlFor='damage' className='py-3 w-full h-[54px] text-sm font-semibold flex justify-center items-center gap-2 bg-zinc-900 hover:bg-overwatch-default peer-checked/damage:bg-overwatch-default transition-all ease-in-out duration-500 rounded'>
                  <Image
                    src={damageIcon}
                    alt='Tank Icon'
                    width={30}
                    height={30}
                    priority
                  />
                </label>
              </div>
            </div>

            <div className='flex-1 flex flex-col gap-2 mb-6'>
              <label htmlFor='hour_start' className='font-semibold'>Qual horário jogar</label>

              <div className='flex w-full gap-2'>
                <input className='relative px-4 py-3 w-full h-[54px] text-sm font-bold bg-zinc-900 rounded' id='hour_start' type='time' {...register('hour_start')} />
                <input className='relative px-4 py-3 w-full h-[54px] text-sm font-bold bg-zinc-900 rounded' id='hour_end' type='time' {...register('hour_end')} />
              </div>
            </div>
          </div>
          
          <div className='flex gap-2 mb-8'>
            <input id='voice_channel' type='checkbox' className='hidden' {...register('voice_channel')} />
            <label id='voice_channel' htmlFor='voice_channel' className="relative h-6 w-6 bg-zinc-900 rounded"></label>
            <label htmlFor='voice_channel'>Costumo me conectar ao chat de voz</label>
          </div>
          
          <div className='flex gap-4 justify-end'>
            <button onClick={closeModal} type="button" className='cursor-pointer px-4 py-3 flex items-center gap-3 font-medium bg-zinc-500/60 hover:bg-zinc-500 transition-all ease-in-out duration-500 rounded-md'>
              Cancelar
            </button>

            <button type="submit" className='cursor-pointer px-4 py-3 flex items-center gap-3 font-medium bg-overwatch-default hover:bg-overwatch-hover transition-all ease-in-out duration-500 rounded-md'>
              <FontAwesomeIcon icon={faGamepad} className='h-[24px]' />
              Encontrar duo
            </button>
          </div>
        </form>
      </dialog>
    </>
  )
}

