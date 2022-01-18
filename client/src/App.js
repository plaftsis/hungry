import React from "react";

import Typography from '@mui/material/Typography';
import Search from './components/Search';
import RecipeGrid from "./components/RecipeGrid";

import './App.css';

import { QueryClient, QueryClientProvider } from "react-query";

const queryClient = new QueryClient();

function App() {
  const [ingredients, setIngredients] = React.useState([]);
  const myRef = React.useRef(null)
  
  const executeScroll = () => myRef.current.scrollIntoView()    

  return (
    <QueryClientProvider client={queryClient}>
      <div className="App">
        <header className="App-header">
          <Typography variant="h1" gutterBottom={true} sx={{ fontWeight: '800'}}>
            Hungry?
          </Typography>
          <Search ingredients={ingredients} setIngredients={setIngredients} executeScroll={executeScroll} />
          <Typography variant="caption" sx={{ marginTop: '25px' }}>
            1. Type an ingredient 2. Press ENTER 3. Repeat
          </Typography>
        </header>
        {ingredients.length > 0 && 
          <div ref={myRef}>
            <RecipeGrid ingredients={ingredients} />
          </div>
        }
      </div>
    </QueryClientProvider>
  );
}

export default App;
