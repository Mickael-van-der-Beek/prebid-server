package tamaris

import (
	"io"
	"strings"
	"net/http"
	"encoding/json"
	"github.com/golang/glog"
	"github.com/prebid/prebid-server/v3/hooks/hookstage"
	"github.com/prebid/openrtb/v20/openrtb2"
)

func handleBidderRequestHook(payload hookstage.BidderRequestPayload) (result hookstage.HookResult[hookstage.BidderRequestPayload], err error) {
	moduleContext := make(hookstage.ModuleContext)

	glog.Warningf("HELLO WORLD BIDDER REQUEST!")

	// User ID (userId) is: payloadRequestCopy.User.buyeruid
	// URL (referrer) is: payloadRequestCopy.Site.page
	// Placement ID (tagId) is: payloadRequestCopy.imp[0].ext.bidder.placementId
	// Seller ID (sellerId) is: payloadRequestCopy.imp[0].ext.bidder.member
	// Device Type (deviceMakeId) is: payloadRequestCopy.sua.mobile
	// Postal Code (postalCode) is: <REQUIRED GEOLOCATION MODULE>
	// External IDs (externalIds) is:

	payloadRequestCopy := *payload.Request

	userJson, _ := json.MarshalIndent(payloadRequestCopy, "", "  ")
	glog.Warningf("USER_JSON")
	glog.Warningf(string(userJson))

	resp, err := http.Get("http://rtdp:8080/bid?userId=188852851391655682&referrer=google.com&tagId=111222333&sellerId=9124&deviceMakeId=0&postalCode=75009&externalIds=")

	if err != nil {
		glog.Warningf("__1")
		return hookstage.HookResult[hookstage.BidderRequestPayload]{
			ModuleContext: moduleContext,
		}, err
	}

	defer resp.Body.Close()

	glog.Warningf("RTDP_STATUS")
	glog.Warningf(resp.Status)

	bodyBytes, err := io.ReadAll(resp.Body)

	if err != nil {
		glog.Warningf("__2")
		return hookstage.HookResult[hookstage.BidderRequestPayload]{
			ModuleContext: moduleContext,
		}, err
	}

	segments := string(bodyBytes)
	glog.Warningf("RTDP_SEGMENTS")
	glog.Warningf(segments)

	if payloadRequestCopy.User == nil {
		glog.Warningf("__3")
		payloadRequestCopy.User = &openrtb2.User{}
	}

	payloadRequestCopy.User.Keywords = strings.Join([]string{ "tamaris=seg-123456" }, ",")

	return hookstage.HookResult[hookstage.BidderRequestPayload]{
		ModuleContext: moduleContext,
	}, nil
}
