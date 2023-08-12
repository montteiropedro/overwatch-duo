import './globals.css'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
const inter = Inter({ subsets: ['latin'], variable: '--font-inter' })

import '@fortawesome/fontawesome-svg-core/styles.css'
import { config } from '@fortawesome/fontawesome-svg-core'
config.autoAddCss = false

import { AuthProvider } from '../contexts/auth'

export const metadata: Metadata = {
  title: 'Overwatch Duo',
  description: 'Created by Matheus Barros and Pedro Monteiro',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang='en'>
        <body className={`${inter.className} ${inter.variable}`}>
          <AuthProvider>{children}</AuthProvider>
        </body>
    </html>
  )
}
