import axios from "axios";

const apiURL = import.meta.env.VITE_API_URL || "http://localhost:3333";

const api = axios.create({
  baseURL: apiURL,
});

export default api;
