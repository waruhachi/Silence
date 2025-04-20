#include <UIKit/UIKit.h>

@interface MPVolumeController : NSObject
@end

@interface MPVolumeControllerSystemDataSource : NSObject

@property (nonatomic, getter=isMuted) BOOL muted;
@property (copy, nonatomic) NSString *volumeAudioCategory;

@end
