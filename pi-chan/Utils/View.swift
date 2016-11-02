//
//  View.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/06.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import DGElasticPullToRefresh

struct View {
    static func refreshLoading() -> DGElasticPullToRefreshLoadingViewCircle {
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        return loadingView
    }
}
