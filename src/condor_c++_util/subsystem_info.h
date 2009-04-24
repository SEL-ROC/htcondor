/***************************************************************
 *
 * Copyright (C) 1990-2008, Condor Team, Computer Sciences Department,
 * University of Wisconsin-Madison, WI.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License.  You may
 * obtain a copy of the License at
 * 
 *    http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ***************************************************************/

#ifndef _SUBSYSTEM_INFO_H_
#define _SUBSYSTEM_INFO_H_

#include "condor_common.h"


// Subsystem type enum

// -----------------------------------------------------------------
// **** README README README README README README README README ****
// -----------------------------------------------------------------
// Only add an entry to this file *IF* some part of Condor
// will need to act differently based on your new subsystem type.
// Otherwise, you should just use SUBSYSTEM_TYPE_DAEMON or
// SUBSYSTEM_TYPE_TOOL.
//
// IF, after reading the above, you decide that you really do need
// add a new daemon type, make sure that you edit the table in
// subsystem_info.C to match:
//   const SubsystemInfoLookup SubsystemInfoTable::m_Table[]
//
// -----------------------------------------------------------------
// **** README README README README README README README README ****
// -----------------------------------------------------------------
typedef enum {
	SUBSYSTEM_TYPE_INVALID = 0,
	SUBSYSTEM_TYPE_MIN = 1,	// Min valid subsystem type, don't start at zero

	// Daemon types
	SUBSYSTEM_TYPE_MASTER,
	SUBSYSTEM_TYPE_COLLECTOR,
	SUBSYSTEM_TYPE_NEGOTIATOR,
	SUBSYSTEM_TYPE_SCHEDD,
	SUBSYSTEM_TYPE_SHADOW,
	SUBSYSTEM_TYPE_STARTD,
	SUBSYSTEM_TYPE_STARTER,
	SUBSYSTEM_TYPE_GAHP,
	SUBSYSTEM_TYPE_DAGMAN,
	SUBSYSTEM_TYPE_DAEMON,		// Other daemon

	// Clients
	SUBSYSTEM_TYPE_TOOL,
	SUBSYSTEM_TYPE_SUBMIT,

	// Jobs
	SUBSYSTEM_TYPE_JOB,

	// Auto type
	SUBSYSTEM_TYPE_AUTO,		// Try to determine type from name

	// Delimiters
	SUBSYSTEM_TYPE_COUNT,
	SUBSYSTEM_TYPE_MAX = SUBSYSTEM_TYPE_COUNT - 1,
} SubsystemType;

// -----------------------------------------------------------------
// **** README README README README README README README README ****
// There's probably no reason for you to EVER add to this
// enumeration.  IF you really really need to, add a isXxxx() method
// to for this new class of subsystem.
// -----------------------------------------------------------------
typedef enum {
	SUBSYSTEM_CLASS_NONE = 0,
	SUBSYSTEM_CLASS_DAEMON,
	SUBSYSTEM_CLASS_CLIENT,
	SUBSYSTEM_CLASS_JOB,
} SubsystemClass;

// Declare C++ things
#if defined(__cplusplus)

class SubsystemInfoLookup;		// pre declaration, internal only
class SubsystemInfoTable;		// pre declaration, internal only
class SubsystemInfo
{
  public:

	// Constructors
	SubsystemInfo( const char *subsystem_name,
				   SubsystemType _type = SUBSYSTEM_TYPE_AUTO );
	~SubsystemInfo( void );

	// Verify the info
	bool isValid( void ) const
		{ return (  (m_Type != SUBSYSTEM_TYPE_INVALID) && m_NameValid ); };

	// Accessors for the subsystem name
	const char *setName( const char *subsystem_name );
	const char *getName( void ) const
		{ return (m_TempName == NULL) ? m_Name : m_TempName; };
	bool nameMatch( const char *name ) const;
	bool isNameValid( void ) const { return m_NameValid; };

	// Temporarily override the subsystem name
	const char *setTempName( const char *subsystem_name );
	void resetTempName( void );

	// Accessors for the subsystem type
	SubsystemType setType( SubsystemType type );
	SubsystemType getType( void ) const { return m_Type; };
	const char *getTypeName( void ) const { return m_TypeName; };
	bool isType( SubsystemType _type ) const { return m_Type == _type; };
	// Guess at the type from the name -- pass NULL to use current name
	SubsystemType setTypeFromName( const char *_type_name = NULL );

	// Subsystem class accessors
	bool isClass( SubsystemClass _class ) const { return m_Class == _class; };
	bool isDaemon( void ) const { return m_Class == SUBSYSTEM_CLASS_DAEMON; };
	bool isJob( void ) const { return m_Class == SUBSYSTEM_CLASS_JOB; };
	bool isClient( void ) const { return m_Class == SUBSYSTEM_CLASS_CLIENT; };
	const char *getClassName( void ) const { return m_ClassName; };

	// Accessors for the local name
	const char *setLocalName( const char * );
	const char *getLocalName( const char *_default = NULL ) const;
	bool hasLocalName( void ) const { return (m_LocalName != NULL); };

	// Debug & related
	const char *getString( void ) const;
	void dprintf( int level ) const;
	void printf( void ) const;

  private:
	const char					*m_Name;
	const char					*m_TempName;
	bool						 m_NameValid;
	SubsystemType				 m_Type;
	const char					*m_TypeName;
	SubsystemClass				 m_Class;
	const SubsystemInfoLookup	*m_Info;
	const SubsystemInfoTable	*m_InfoTable;
	const char					*m_ClassName;
	const char					*m_LocalName;

	// Internal only methods
	SubsystemType setType( SubsystemType _type, const char *_type_name );
	SubsystemType setType ( const SubsystemInfoLookup *,
							const char *_type_name );
	SubsystemClass setClass ( const SubsystemInfoLookup * );
};

extern SubsystemInfo* get_mySubSystem();

// Macro to declare subsystem info
#define DECL_SUBSYSTEM(_name_,_type_) \
	SubsystemInfo* get_mySubSystem() { \
		static SubsystemInfo* mySubSystem \
			= new SubsystemInfo(_name_,_type_); \
		return mySubSystem; }

#endif	// C++


// "C" accessors
BEGIN_C_DECLS

const char* get_mySubSystemName(void);
SubsystemType get_mySubSystemType(void);
	
END_C_DECLS


#endif /* _SUBSYSTEM_INFO_H_ */
