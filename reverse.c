
#include "stack_fDoble.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
/* Include here any other headers you need */

/**
 * @brief: Reverses a string
 * @param str, String to reverse
 * @return A newly allocated string with the reversed string
 **/

char *string_invert(char *str)
{
  /* It is MANDATORY that you use a stack to implement this function */
  /* Failure to do so will result in a FAIL grade */

  /* Es OBLIGATORIO usar una pila para implementar esta función */
  /* No hacerlo implica un NO APTO */

  /*YOUR CODE HERE - TU CÓDIGO AQUÍ */

  Stack *s;
  char *out = NULL;
  int i = 0, n = 0;
  Status st = OK;
  void *v = NULL;

  if (str == NULL)
  {
    return NULL;
  }
  s = stack_init();
  if (s == NULL)
  {
    return NULL;
  }
  out = (char *)malloc(sizeof(char) * (strlen(str)+1));
  if (out == NULL)
  {
    stack_free(s);
    return NULL;
  }
  for (i = 0; i < strlen(str) && st == OK; i++)
  {
    v = &str[i];
    st = stack_push(s, v);
  }
  if (st == ERROR)
  {
    stack_free(s);
    return NULL;
  }

  for (n = 0; n < i; n++)
  {
    v = stack_pop(s);
    out[n] = *((char *)v);
  }

  out[n]= '\0';
  stack_free(s);
  return out;
}

/**
 * @brief: Reverse the words of an input string to an output string.
 *
 * @example: "Hello World" => "olleH dlroW"
 * The words in the input string are separated by a space character.
 * The strings may not overlap, and the destination string strout
 * must be large enough to receive the inverted expression.
 *
 * @param strout, Pointer to the output buffer
 * @param strin, Pointer to the input expression
 * @return The function returns OK or ERROR
 **/

Status reverseWords(char *strout, char *strin)

/* It is MANDATORY that you use a stack to implement this function */
/* Failure to do so will result in a FAIL grade */

/* Es OBLIGATORIO usar una pila para implementar esta función */
/* No hacerlo implica un NO APTO */

/* YOUR CODE HERE - TU CÓDIGO AQUÍ */

/* It is MANDATORY that you use a stack to implement this function */
/* Failure to do so will result in a FAIL grade */

/* Es OBLIGATORIO usar una pila para implementar esta función */
/* No hacerlo implica un NO APTO */

/*YOUR CODE HERE - TU CÓDIGO AQUÍ */
{

  Stack *s;
  int i = 0, n = 0;
  Status st = OK;
  void *v = NULL;
  
  
  
  if (strin == NULL || strout == NULL
  )
  {
    return ERROR;
  }
  s = stack_init();
  if (s == NULL)
  {
    return ERROR;
  }
  
  for (i = 0; i < strlen(strin) && st == OK; i++)
  {
    if (strin[i] == ' ')
    {
      for (; n < i; n++)
      {
        v = stack_pop(s);
        strout[n] = *((char *)v);
      }
      strout[n] = ' ';
      n++;
    }
    else
    {
      v = &strin[i];
      st = stack_push(s, v);
    }
  }

  if (st == ERROR)
  {
    stack_free(s);
    return ERROR;
  }

  for (; n < i; n++)
  {

    v = stack_pop(s);
    strout[n] = *((char *)v);
  }
  strout[n] = '\0';
  stack_free(s);

  return OK;
}
