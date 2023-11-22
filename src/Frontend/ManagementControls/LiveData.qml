import QtQuick
import Frontend.QmlObjects.LiveData as WorLiveData

/**
 *
 */
WorLiveData.QmlLiveData {
	id: root

	Component.onCompleted: {
		liveDataTracker.liveDataChanged.connect(root.liveDataChanged);
	}
}
