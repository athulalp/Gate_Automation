#include <stdio.h>
#include "target_config.h"
#include "user_config.h"
#include "error.h"


void main(void){
eRetCode ret;

	/*initialize hardware*/
	ret = initilize_target(gsTargetConfig);

	if(ret == RET_SUCCESS){
		/*initialize feature configurations*/
		ret = initilize_feature_config(gsFeatureConfig);
	}

	if(ret == RET_SUCCESS){
		/*initialize user_configurations*/
		ret = initialize_user_config(gsUserConfig);
	}
	
	
	


}