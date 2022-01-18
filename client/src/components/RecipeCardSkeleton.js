import * as React from 'react';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardContent from '@mui/material/CardContent';
import Skeleton from '@mui/material/Skeleton';

export default function RecipeCardSkeleton(props) {
  return (
    <Card sx={{ maxWidth: 345, m: 2 }}>
      <CardHeader
        title={
          <React.Fragment>
            <Skeleton
              animation="wave"
              height={16}
              width="95%"
              style={{ marginBottom: 6 }}
            />
            <Skeleton
              animation="wave"
              height={16}
              width="35%"
              style={{ marginBottom: 6 }}
            />
          </React.Fragment>
        }
        subheader={
          <Skeleton animation="wave" height={10} width="50%" />
        }
      />
      <Skeleton sx={{ height: 194 }} animation="wave" variant="rectangular" />
      <CardContent>
          <React.Fragment>
            <Skeleton animation="wave" height={10} style={{ marginBottom: 6 }} width="35%" />
            <Skeleton animation="wave" height={10} style={{ marginBottom: 6 }} width="85%" />
            <Skeleton animation="wave" height={10} style={{ marginBottom: 6 }} width="90%" />
            <Skeleton animation="wave" height={10} style={{ marginBottom: 6 }} width="55%" />
            <Skeleton animation="wave" height={20} style={{ marginBottom: 6 }}  width="85%" />
            <Skeleton animation="wave" height={20} width="75%" />
          </React.Fragment>
      </CardContent>
    </Card>
  );
}
