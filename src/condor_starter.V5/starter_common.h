/***************************Copyright-DO-NOT-REMOVE-THIS-LINE**
 * CONDOR Copyright Notice
 *
 * See LICENSE.TXT for additional notices and disclaimers.
 *
 * Copyright (c)1990-1998 CONDOR Team, Computer Sciences Department, 
 * University of Wisconsin-Madison, Madison, WI.  All Rights Reserved.  
 * No use of the CONDOR Software Program Source Code is authorized 
 * without the express consent of the CONDOR Team.  For more information 
 * contact: CONDOR Team, Attention: Professor Miron Livny, 
 * 7367 Computer Sciences, 1210 W. Dayton St., Madison, WI 53706-1685, 
 * (608) 262-0856 or miron@cs.wisc.edu.
 *
 * U.S. Government Rights Restrictions: Use, duplication, or disclosure 
 * by the U.S. Government is subject to restrictions as set forth in 
 * subparagraph (c)(1)(ii) of The Rights in Technical Data and Computer 
 * Software clause at DFARS 252.227-7013 or subparagraphs (c)(1) and 
 * (2) of Commercial Computer Software-Restricted Rights at 48 CFR 
 * 52.227-19, as applicable, CONDOR Team, Attention: Professor Miron 
 * Livny, 7367 Computer Sciences, 1210 W. Dayton St., Madison, 
 * WI 53706-1685, (608) 262-0856 or miron@cs.wisc.edu.
****************************Copyright-DO-NOT-REMOVE-THIS-LINE**/

#ifndef CONDOR_STARTER_COMMON_H
#define CONDOR_STARTER_COMMON_H

#include "condor_uid.h"
#include "condor_config.h"
#include "condor_debug.h"
#include "condor_io.h"
#include "condor_jobqueue.h"
#include "condor_sys.h"
#include "my_hostname.h"

void init_sig_mask();
void initial_bookeeping( int argc, char *argv[] );
void init_shadow_connections();
void read_config_files();
void init_logging();
void usage( char *my_name );
ReliSock* NewConnection( int id );
void support_job_wrapper(char *a_out_name,int *argc, char *argv[]);

extern "C" int exception_cleanup();

#endif /* CONDOR_STARTER_COMMON_H */
