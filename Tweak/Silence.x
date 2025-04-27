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

%hook SBVolumeControl

- (void)decreaseVolume {
    %orig;

    lastActionWasDecrease = YES;
}

- (void)increaseVolume {
    %orig;

    lastActionWasDecrease = NO;
}

- (void)_updateEffectiveVolume:(float)arg0 {
    %orig;

    if (previousVolume >= 0 && fabsf(previousVolume - arg0) < 0.001f && lastActionWasDecrease) {
        [self toggleMute];
    }

    previousVolume = arg0;
}

%end
