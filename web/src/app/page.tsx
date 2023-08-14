'use client'
import Image from 'next/image'
import { GameModeCard } from '../components/GameModeCard'
import { TabMenu } from '../components/TabMenu'
import { useEffect, useState } from 'react'
import api from '../services/api'

interface IGameMode {
  name: string;
  ads_count: number;
}

export default function Home() {
  const [gameModes, setGameModes] = useState<IGameMode[] | null>(null)
  
  useEffect(() => {
    api.get('/api/v1/game_modes').then(({ data }) => {
      setGameModes(data)
      console.log('game modes:', gameModes)
    }).catch(error => console.error(error))
  }, [])  

  return (
    <main className=''>
      <Image
        src="/logo.svg"
        alt="Overwatch"
        className="mx-auto mb-16 w-[282px] h-[162px]"
        width={282}
        height={162}
      />

      <h1 className='mb-16 text-center text-6xl font-black'>Seu <span className='animate-pulse bg-clip-text bg-duo-gradient text-transparent '>duo</span> está aqui</h1>

      <div className='mx-auto flex gap-6 items-center justify-center'>
        {gameModes?.map((mode, index) => (
          <GameModeCard
            key={index}
            gameMode={mode.name}
            adsCount={mode.ads_count}
            modeImage={`/game_mode/${mode.name}.png`}
            modeLogo={`/mode_logos/${mode.name}.svg`}
          />
        ))} 
      </div>

      <TabMenu />
    </main>   
  )
}
