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

#include "sysapi.h"
 
#if defined(HPUX)

#include <sys/pstat.h>

int
sysapi_phys_memory_raw()
{
	struct pst_static s;
	unsigned long pages, pagesz;
						   
	if (pstat_getstatic(&s, sizeof(s), (size_t)1, 0) != -1) {
		pages = s.physical_memory;
		pagesz = s.page_size >> 10;
		return( (int)((pages * pagesz) >> 10) );
	} else {
		return -1;
	}
}

#elif defined(IRIX62)

#include <unistd.h>
#include <sys/types.h>
#include <sys/sysmp.h>

int
sysapi_phys_memory_raw()
{
	struct rminfo rmstruct;
	long pages, pagesz;
	pagesz = (sysconf(_SC_PAGESIZE) >> 10);		// We want kbytes.
	
	if( (sysmp(MP_SAGET,MPSA_RMINFO,&rmstruct,sizeof(rmstruct)) < 0) ||
		(pagesz == -1) ) { 
		return -1;
	}
		/* Correct what appears to be some kind of rounding error */
	if( rmstruct.physmem % 2 ) {
		pages = rmstruct.physmem + 1;
	} else {
		pages = rmstruct.physmem;
	}

		/* Return the answer in megs */
	return( (int)((pages * pagesz) >> 10) );
}

#elif defined(Solaris) 

/*
 * This works for Solaris >= 2.3
 */
#include <unistd.h>

int
sysapi_phys_memory_raw()
{
	long pages, pagesz, hack;

	pages = sysconf(_SC_PHYS_PAGES);
	pagesz = (sysconf(_SC_PAGESIZE) >> 10);		// We want kbytes.

	if (pages == -1 || pagesz == -1 ) {
		return -1;
	}

#if defined(X86)
		/* 
		   This is super-ugly.  For some reason, Intel Solaris seems
		   to have some kind of rounding error for reporting memory.
		   These values just came from a little trail and error and
		   seem to work pretty well.  -Derek Wright (1/29/98)
 	    */
	hack = (pages * pagesz);
	if( hack > 260000 ) {
		return (int) (hack / 1023);		
	} else if( hack > 130000 ) {
		return (int) (hack / 1020);
	} else if( hack > 65000 ) {
		return (int) (hack / 1010);
	} else {
		return (int) (hack / 1000);
	}
#else
	return( (int)((pages * pagesz) >> 10) );
#endif
}

#elif defined(LINUX)
#include <stdio.h>

int 
sysapi_phys_memory_raw() 
{	

	FILE	*proc;
	double	phys_mem;
	char	tmp_c[20];
	char	c;

	proc=fopen("/proc/meminfo","r");
	if(!proc) {
		return -1;
	}

	  /*
	  // The /proc/meminfo looks something like this:

	  //       total:    used:    free:  shared: buffers:  cached:
	  //Mem:  19578880 19374080   204800  7671808  1191936  8253440
	  //Swap: 42831872  8368128 34463744
	  //MemTotal:     19120 kB
	  //MemFree:        200 kB
	  //MemShared:     7492 kB
	  //Buffers:       1164 kB
	  //Cached:        8060 kB
	  //SwapTotal:    41828 kB
	  //SwapFree:     33656 kB
	  */	  
	while((c=fgetc(proc))!='\n');
	fscanf(proc, "%s %lf", tmp_c, &phys_mem);
	fclose(proc);
	return (int)(phys_mem/1024000.0);
}

#elif defined(WIN32)

#include "condor_common.h"

int
sysapi_phys_memory_raw()
{
	MEMORYSTATUS status;
	GlobalMemoryStatus(&status);
	return (int)( ceil(status.dwTotalPhys/(1024*1024)+.4 ) );
}

#elif defined(OSF1)

#include "condor_common.h"

/* Need these two to avoid compiler warning since <sys/table.h>
   includes a stupid version of <net/if.h> that does forward decls of
   struct mbuf and struct rtentry for C++, but not C. -Derek 6/3/98 */
#include <sys/mbuf.h>
#include <net/route.h>

#include <sys/table.h>

int
sysapi_phys_memory_raw()
{
	struct tbl_pmemstats s;
	if (table(TBL_PMEMSTATS,0,(void *)&s,1,sizeof(s)) < 0) {
		return -1;
	}
	return (int)(s.physmem/(1024*1024));
}

#else	/* Don't know how to do this on other than SunOS and HPUX yet */
int
sysapi_phys_memory_raw()
{
	return -1;
}
#endif


/* This is the cooked version of sysapi_phys_memory_raw(). Where as the raw
	function gives you the raw number, this function can process the number
	for you for some reason and return that instead.
*/
int
sysapi_phys_memory()
{
	/* right now, it is an idenity mapping from the raw version */
	sysapi_phys_memory_raw();
}






