import Image from 'next/image'

interface IGameModeCard {
  gameMode: string;
  adsCount: number;
  modeLogo: string;
  modeImage: string;
}

export function GameModeCard({ gameMode, adsCount, modeLogo, modeImage }: IGameModeCard) {
  return (
    <div className="relative flex flex-col justify-between p-4 w-[180px] h-[240px] rounded-lg overflow-hidden hover:outline hover:outline-2">
      <Image
        src={modeImage}
        alt={gameMode}
        className="opacity-10 hover:opacity-100 -z-10 "
        style={{ objectFit: "cover" }}
        sizes='0%'
        fill
        priority
      />

      <Image
        src={modeLogo}
        alt={gameMode}
        width={60}
        height={60}
        className='self-center mt-7'
        priority
      />
 
      <div className={`flex flex-col justify-end absolute bottom-0 left-0 h-full w-full p-4 bg-card-gradient hover:bg-card-gradient-${gameMode} rounded-lg`}>  
        <h2 className="font-bold uppercase">{gameMode}</h2> 
        <span className='text-sm font-medium text-zinc-300'>{adsCount} {adsCount === 1 ? 'Anúncio' : 'Anúncios' }</span>
      </div>  
    </div>
  );
}
