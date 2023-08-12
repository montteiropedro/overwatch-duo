import Image from 'next/image'

interface IGameModeCard {
  gameMode: string;
  adsCount: number;
  modeLogo: string;
  modeImage: string;
}

interface IColors {
  unranked: string;
  competitive: string;
  arcade: string;
  custom_game: string;
}

export function GameModeCard({ gameMode, adsCount, modeLogo, modeImage }: IGameModeCard) {
  const outlineColors: IColors = {
    unranked: 'outline-unranked-default',
    competitive: 'outline-competitive-default',
    arcade: 'outline-arcade-default',
    custom_game: 'outline-custom_game-default'
  }
  
  const gradientHovers: IColors = {
    unranked: 'hover:bg-card-gradient-unranked',
    competitive: 'hover:bg-card-gradient-competitive',
    arcade: 'hover:bg-card-gradient-arcade',
    custom_game: 'hover:bg-card-gradient-custom_game',
  }

  return (
    <div className={`group relative mb-8 flex flex-col justify-between p-4 w-[180px] h-[240px] rounded-lg overflow-hidden hover:outline outline-2 outline-offset-4 ${outlineColors[gameMode as keyof IColors]}`}>
      <Image
        src={modeImage}
        alt={gameMode}
        width={180}
        height={240}
        className="absolute object-cover inset-0 h-full w-full opacity-10 group-hover:opacity-100 group-hover:h-[105%] group-hover:w-[105%] -z-10 transition-all ease-in-out duration-300"
        priority={true}
      />

      <Image
        src={modeLogo}
        alt={gameMode}
        width={60}
        height={60}
        className='self-center mt-7 group-hover:hidden transition-all ease-in-out duration-500'
      />
 
      <div className={`flex flex-col justify-end absolute bottom-0 left-0 h-full w-full p-4 bg-card-gradient ${gradientHovers[gameMode as keyof IColors]} rounded-lg`}>  
        <h2 className="font-bold uppercase">{gameMode.replace('_', ' ')}</h2> 
        <span className='text-sm font-medium text-zinc-300'>{adsCount} {adsCount === 1 ? 'Anúncio' : 'Anúncios' }</span>
      </div>
    </div>
  );
}
