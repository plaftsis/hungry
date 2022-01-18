import React from "react";

import Autocomplete from "@mui/material/Autocomplete";
import TextField from "@mui/material/TextField";
import InputAdornment from "@mui/material/InputAdornment";
import IconButton from '@mui/material/IconButton';
import SearchIcon from "@mui/icons-material/Search";

import { useForm, Controller } from "react-hook-form";

export default function Search(props) {
  const {ingredients, setIngredients, executeScroll} = props;
  const initialPlaceholder = "What's on your fridge?"
  const [placeholder, setPlaceholder] = React.useState(initialPlaceholder);

  const { control, handleSubmit } = useForm({
    defaultValues: {
      ingredients: []
    }
  });

  const onSubmit = (data) => {
    setPlaceholder("");
    setIngredients(data.ingredients);
    executeScroll();
  };

  return (
    <div style={{ display: 'flex', justifyContent: 'center'}}>
      <form onSubmit={handleSubmit(onSubmit)}>
        <Controller
          render={({ field }) => (
            <Autocomplete
              {...field}
              multiple
              freeSolo
              sx={{
                backgroundColor: "white",
                padding: 1.5,
                borderRadius: 7,
                boxShadow: 1,
                width: "85vmin"
              }}
              options={[]}
              defaultValue={[]}
              ChipProps={{ size: "small" }}
              clearOnEscape
              renderInput={(params) => (
                <TextField
                  {...params}
                  variant="standard"
                  placeholder={placeholder}
                  onFocus={() => setPlaceholder("")}
                  onBlur={() => { ingredients.length === 0 && setPlaceholder(initialPlaceholder) }}
                  InputProps={{
                    ...params.InputProps,
                    disableUnderline: true,
                    startAdornment: (
                      <>
                        <InputAdornment position="start">
                          <IconButton onClick={handleSubmit(onSubmit)}>
                            <SearchIcon />
                          </IconButton>
                        </InputAdornment>
                        {params.InputProps.startAdornment}
                      </>
                    )
                  }}
                />
              )}
              onChange={(_, data, reason) => {
                if (reason === "clear") {
                  setIngredients([]);
                }
                field.onChange(data);
              }}
            />
          )}
          name="ingredients"
          control={control}
        />
      </form>
    </div>
  );
}
