package tamaris

import (
	"github.com/golang/glog"
	"github.com/prebid/prebid-server/v3/hooks/hookstage"
)

func handleBidderRequestHook(payload hookstage.BidderRequestPayload) (result hookstage.HookResult[hookstage.BidderRequestPayload], err error) {
	moduleContext := make(hookstage.ModuleContext)

	glog.Warningf("HELLO WORLD BIDDER REQUEST!")

	return hookstage.HookResult[hookstage.BidderRequestPayload]{
		ModuleContext: moduleContext,
	}, nil
}
