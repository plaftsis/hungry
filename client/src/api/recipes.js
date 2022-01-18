import axios from "axios";

export const getRecipes = async (q, page) => {
  const { data } = await axios.get("recipes", { params: { q: q, page: page }});
  return data;
}
