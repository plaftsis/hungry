import React from 'react';

import Box from '@mui/material/Box';
import Stack from '@mui/material/Stack';
import Grid from '@mui/material/Grid';
import IconButton from '@mui/material/IconButton';
import NavigateBeforeIcon from '@mui/icons-material/NavigateBefore';
import NavigateNextIcon from '@mui/icons-material/NavigateNext';
import Alert from '@mui/material/Alert';

import RecipeCardSkeleton from './RecipeCardSkeleton';
import RecipeCard from './RecipeCard';

import { useQuery } from "react-query";
import { getRecipes } from '../api/recipes';

export default function RecipeGrid(props) {
  const {ingredients} = props;
  const [page, setPage] = React.useState(1);

  const {isLoading,  error, data, isFetching, isPreviousData} = useQuery(
    ["recipes", ingredients, page], 
    () => getRecipes(ingredients, page), 
    { keepPreviousData : true, retry: false }
  );

  if (isLoading || isFetching) return (
    <Box sx={{ padding: 5, flexGrow: 1 }}>
      <Grid container spacing={{ xs: 2, md: 3 }} columns={{ xs: 4, sm: 8, md: 12 }}>
        {Array(8).fill(null).map((item, index) => (
          <Grid item xs={4} sm={4} md={3} key={index}>
            <RecipeCardSkeleton />
          </Grid>
        ))}
      </Grid>
    </Box>
  )

  if (error && error.response) return <Alert severity="error">{error.response.data.error}</Alert>;

  if (error) return <Alert severity="error">{error.message}</Alert>;
  
  return (
    <Stack spacing={2} sx={{ padding: 5, flexGrow: 1 }}>
      <Grid container spacing={{ xs: 2, md: 3 }} columns={{ xs: 4, sm: 8, md: 12 }}>
        {data && data.recipes.map((recipe) => (
          <Grid item xs={4} sm={4} md={3} key={recipe.id}>
            <RecipeCard recipe={recipe} />
          </Grid>
        ))}
      </Grid>
      <Stack direction="row" spacing={2} justifyContent="center">
        <IconButton
          onClick={() => setPage(old => Math.max(old-1, 1))}
          disabled={page === 1}
        >
          <NavigateBeforeIcon />
        </IconButton>
        <IconButton
          onClick={() => setPage(old => (data?.hasMore ? old+1 : old))}
          disabled={isPreviousData || !data?.hasMore}
        >
          <NavigateNextIcon />
        </IconButton>
      </Stack>
    </Stack>
  );
}
