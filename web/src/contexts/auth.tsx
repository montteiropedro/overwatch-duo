'use client'
import React, { createContext, useContext, useEffect, useState } from "react"
import api from '../services/api'

interface IUser {
  id: string;
  username: string;
  avatar: string;
}

interface IAuthContext {
  isAuthenticated: boolean;
  user: IUser | null;
  login: () => void;
  logout: () => void;
}

const AuthContext = createContext({} as IAuthContext)

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<IUser | null>(null)

  useEffect(() => {
    (async () => {
      await api.get("/auth/profile", {
        withCredentials: true
      })
      .then(res => setUser(res.data))
      .catch(({ response }) => console.error(response.statusText));
    })();
  }, []);

  const login = async () => await api.get('/auth/discord').then(({ data }) => window.location.href = data);
  const logout = async () => await api.delete('/auth/discord/logout', { withCredentials: true }).then(res => location.reload())

  return (
    <AuthContext.Provider value={{ isAuthenticated: !!user, user, login, logout }}>
      {children}
    </AuthContext.Provider>
  )
}

export const useAuth = () => useContext(AuthContext)

