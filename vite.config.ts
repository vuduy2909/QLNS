import * as dotenv from 'dotenv'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

dotenv.config()

export default defineConfig({
  base: process.env.NODE_ENV === "production" ? "/static/" : "/",
  build: {
    manifest: true
  },
  plugins: [react()],
  root: "src",
  server: {
    proxy: {
      '/api': 'http://127.0.0.1:8000', 
    }
  }
})
