package tamaris

import (
	"github.com/prebid/prebid-server/v3/hooks/hookstage"
)

func handleBidderRequestHook(payload hookstage.BidderRequestPayload) (result hookstage.HookResult[hookstage.BidderRequestPayload], err error) {
	moduleContext := make(hookstage.ModuleContext)

	return hookstage.HookResult[hookstage.BidderRequestPayload]{
		ModuleContext: moduleContext,
	}, nil
}
