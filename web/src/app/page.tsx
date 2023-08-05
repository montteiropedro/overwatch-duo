import Image from 'next/image'
import { GameModeCard } from '../components/GameModeCard'
import { TabMenu } from '../components/TabMenu'

export default function Home() {
  const gameModes: string[] = ['unranked', 'competitive', 'arcade', 'custom_game']
  
  return (
    <main className=''>
      <Image
        src="/logo.svg"
        alt="Overwatch"
        className="mx-auto mb-16 w-[282px] h-[162px]"
        width={282}
        height={162}
        priority
      />

      <h1 className='mb-16 text-center text-6xl font-black'>Seu <span className='animate-pulse bg-clip-text bg-default-gradient text-transparent '>duo</span> está aqui</h1>

      <div className='mx-auto flex gap-6 items-center justify-center'>
        {gameModes.map((mode, index) => (
          <GameModeCard
            key={index}
            gameMode={mode}
            adsCount={0}
            modeImage={`/game_mode/${mode}.png`}
            modeLogo={`/mode_logos/${mode}.svg`}
          />
        ))} 
      </div>

      <TabMenu />
    </main>   
  )
}
