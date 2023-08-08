import './globals.css'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import { AuthProvider } from '../contexts/auth'

const inter = Inter({ subsets: ['latin'] })

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
    <html lang="en">
        <body className={inter.className}>
          <AuthProvider>{children}</AuthProvider>
        </body>
    </html>
  )
}
