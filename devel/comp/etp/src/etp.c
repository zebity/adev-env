# include <stdio.h>
# include <string.h>

int main( int argc, char **argv )
{

	FILE *fd = NULL;
	char token[256];

	char *TOKEN = argv[1];
	char *filename = argv[2];

	int cont_flag = 0;

	if (( fd = fopen( filename, "r" )) == NULL )  
	{
		perror( argv[0] );
	}
	else
	{
		/* We opened the file */
		while ( fscanf( fd, "%s", token ) != EOF ) 
		{
			if ( strcmp( token, "#" ) == 0 )
			{
				/* We have a comment, therefore read till end of line */ 
				fgets( token, 255, fd );
			}
			else
			{
				/* Check out each token */
				if ( strcmp( TOKEN, token ) == 0 )
				{
					/* Read the next token, i.e. = */
					fscanf( fd, "%s", token ); 
					do
					{
						fscanf( fd, "%s", token ); 
						if ( strcmp( token, "\\" ) != 0 )
						{
							/* i.e. Found a word */
							if ( strstr( token, "\\" ) != NULL )
							{	
								char stripped_token[256];

								/* Word has a backslash in it */
								cont_flag = 1;
								strncpy(stripped_token,token,strlen(token) -1);
								printf("%s\n", stripped_token );
							}
							else
							{
								printf("%s\n", token);

								fscanf( fd, "%s", token );
								if ( strcmp( token, "\\" ) == 0 )
								{
									cont_flag = 1;
								}
								else
								{
									cont_flag = 0;
								}
							}
						}
						else
						{
							/* We have a backslash */
							fscanf( fd, "%s", token );
							cont_flag = 1;
						}
					} while(cont_flag == 1);
				}
			}
		}
	}
	return 0;
}
