# include <sys/types.h>
# include <stdio.h>
# include <string.h>

main( int argc, char **argv )
{

	int ret_val;

	/* Store the old uid's */
	uid_t OldUID;
	uid_t OldeUID;
	
	uid_t newUID = 0;
	uid_t neweUID = 0;

	/* Get the current, real and effective UID */
	OldUID = getuid();
	OldeUID = geteuid();


	/* Switch to the new UID's */
	ret_val = setuid( newUID );
	ret_val = seteuid( neweUID );

	/* Now in super-user mode */

	if ( strcmp(argv[0] , "put") == 0 )
	{
		/* The put command, wants to execute */
		int i;
		char p_string[80];
		char p_user_id[20];

		sprintf( p_user_id, "-u%d", OldUID ); 

		strcpy( p_string, "put_script" );
		strcat( p_string,  " " );
		strcat( p_string, p_user_id );
		strcat( p_string,  " " );


		for ( i = 1; i< argc; i++ )
		{
		    strcat( p_string,  argv[i] );
		    strcat( p_string,  " " );
		}
		system ( p_string );
	}
	else if ( strcmp(argv[0] , "get" ) == 0 )
	{
		/* The get command wants to execute */
		int i;
		char g_string[80];
		char g_user_id[20];

		sprintf( g_user_id, "%s%d", "-u", OldUID ); 

		strcpy( g_string, "get_script" );
		strcat( g_string,  " " );
		strcat( g_string, g_user_id );
		strcat( g_string,  " " );

		for ( i = 1; i< argc; i++ )
		{
		    strcat( g_string,  argv[i] );
		    strcat( g_string,  " " );
		}
		system ( g_string );
	}
	else if ( strcmp(argv[0] , "GetComponent" ) == 0 )
	{
		/* The get command wants to execute */
		int i;
		char gc_string[80];
		char gc_user_id[20];

		sprintf( gc_user_id, "%s%d", "-u", OldUID ); 

		strcpy( gc_string, "get_component_script" );
		strcat( gc_string,  " " );
		strcat( gc_string, gc_user_id );
		strcat( gc_string,  " " );

		for ( i = 1; i< argc; i++ )
		{
		    strcat( gc_string,  argv[i] );
		    strcat( gc_string,  " " );
		}
		system ( gc_string );
	}
	else if ( strcmp(argv[0] , "PutComponent" ) == 0 )
	{
		/* The get command wants to execute */
		int i;
		char pc_string[80];
		char pc_user_id[20];

		sprintf( pc_user_id, "%s%d", "-u", OldUID ); 

		strcpy( pc_string, "put_component_script" );
		strcat( pc_string,  " " );
		strcat( pc_string, pc_user_id );
		strcat( pc_string,  " " );

		for ( i = 1; i< argc; i++ )
		{
		    strcat( pc_string,  argv[i] );
		    strcat( pc_string,  " " );
		}
		system ( pc_string );
	}
	else if ( strcmp(argv[0] , "InsertComponent" ) == 0 )
	{
		/* The get command wants to execute */
		int i;
		char ic_string[80];
		char ic_user_id[20];

		sprintf( ic_user_id, "%s%d", "-u", OldUID ); 

		strcpy( ic_string, "insert_component_script" );
		strcat( ic_string,  " " );
		strcat( ic_string, ic_user_id );
		strcat( ic_string,  " " );

		for ( i = 1; i< argc; i++ )
		{
		    strcat( ic_string,  argv[i] );
		    strcat( ic_string,  " " );
		}
		system ( ic_string );
	}
	else if ( strcmp(argv[0] , "CreateMaintenanceRelease" ) == 0 )
	{
		/* The get command wants to execute */
		int i;
		char cmr_string[80];

		strcpy(cmr_string, "create_maintenance_release_script");
		strcat( cmr_string,  " " );

		for ( i = 1; i< argc; i++ )
		{
		    strcat( cmr_string,  argv[i] );
		    strcat( cmr_string,  " " );
		}
		system ( cmr_string );
	}

	/* Switch back to the old UID's */
	setuid( OldUID );
	seteuid( OldeUID );
}
