 ###############################################################
 # 
 # Copyright 2011 Red Hat, Inc. 
 # 
 # Licensed under the Apache License, Version 2.0 (the "License"); you 
 # may not use this file except in compliance with the License.  You may 
 # obtain a copy of the License at 
 # 
 #    http://www.apache.org/licenses/LICENSE-2.0 
 # 
 # Unless required by applicable law or agreed to in writing, software 
 # distributed under the License is distributed on an "AS IS" BASIS, 
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and 
 # limitations under the License. 
 # 
 ############################################################### 

include_directories(${CONDOR_SCHEDD_SRC_DIR})

## Create targets
file( GLOB shadowRmvElements Example* *.t.* )
# Build a small shadow on 32-bit Linux platforms
if (LINUX AND (${BIT_MODE} MATCHES "32"))
    condor_daemon( shadow_s "${shadowRmvElements}" "${CONDOR_LIBS_FOR_SHADOW}" "${C_SBIN}" )
endif()
condor_daemon( shadow "${shadowRmvElements}" "${CONDOR_LIBS_FOR_SHADOW}" "${C_SBIN}" )

