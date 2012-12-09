
#ifndef __nat_configuration_h_
#define __nat_configuration_h_

#include "network_configuration.h"

#include "address_selection.h"

namespace lark {

class NATConfiguration : public NetworkConfiguration {

public:
	NATConfiguration(classad_shared_ptr<classad::ClassAd> machine_ad)
		: NetworkConfiguration(machine_ad),
		  m_ad(machine_ad)
		{}

	virtual int Setup();
	virtual int Cleanup();

private:
	classad_shared_ptr<classad::ClassAd> m_ad;

};

}

#endif
