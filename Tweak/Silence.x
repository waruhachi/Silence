#include "Silence.h"

%hook MPVolumeController

- (void)volumeControllerDataSource:(id)arg0 didChangeVolume:(float)arg1 {
    MPVolumeControllerSystemDataSource *dataSource = (MPVolumeControllerSystemDataSource *)arg0;

    if ([dataSource isKindOfClass:[%c(MPVolumeControllerSystemDataSource) class]]) {
        if (arg1 == 0.0 && [[dataSource volumeAudioCategory] isEqualToString:@"PhoneCall"] && ![dataSource isMuted]) {
            [dataSource setMuted:YES];
        }
    }

    %orig;
}

%end
