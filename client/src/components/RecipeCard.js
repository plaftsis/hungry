import React from 'react';

import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardMedia from '@mui/material/CardMedia';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import Rating from '@mui/material/Rating';
import Chip from '@mui/material/Chip';
import noImageUrl from '../assets/no_image.png';

import { styled } from '@mui/material/styles';

const ListItem = styled('li')(({ theme }) => ({
  margin: theme.spacing(0.5, 0.5, 0.5, 0),
}));

export default function RecipeReviewCard(props) {
  const {recipe} = props;

  return (
    <Card sx={{ maxWidth: 345 }}>
      <CardHeader
        title={
          <Typography variant="h6">
            {recipe.name}
          </Typography>
        }
        subheader={
          <Typography variant="subtitle2" color="text.secondary">
            {recipe.difficulty.name} • {recipe.budget.name} • {recipe.total_time}
          </Typography>
        }
      />
      <CardMedia
        component="img"
        height="194"
        image={recipe.image ? recipe.image : noImageUrl}
      />
      <CardContent>
        <Typography component="div">
          <Rating name="half-rating-read" defaultValue={recipe.rate} precision={0.5} readOnly size="small"/>
        </Typography>
        <Typography variant="body2">
          Ingredients: {recipe.ingredients.map((ingredient, index) => (
            ingredient.name + (index < recipe.ingredients.length - 1 ? ', ' : '')
          ))}
        </Typography>
        <Typography sx={{
          display: 'flex',
          flexWrap: 'wrap',
          listStyle: 'none',
          margin: 0,
          padding: 0,
        }}
        component="ul">
          {recipe.tags.map((tag) => (
            <ListItem key={tag.id}>
              <Chip label={tag.name} size="small" />
          </ListItem>
          ))}
        </Typography>
      </CardContent>
    </Card>
  );
}
