#include <UIKit/UIKit.h>

@interface MPVolumeController : NSObject
@end

@interface MPVolumeControllerSystemDataSource : NSObject

@property (nonatomic, getter=isMuted) BOOL muted;
@property (copy, nonatomic) NSString *volumeAudioCategory;

@end

@interface SBVolumeControl : NSObject

- (void)toggleMute;

@end

static float previousVolume = -1.0f;
static BOOL lastActionWasDecrease = NO;
