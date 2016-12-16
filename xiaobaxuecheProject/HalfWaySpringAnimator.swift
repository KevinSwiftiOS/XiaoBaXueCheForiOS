//
//  HalfWaySpringAnimator.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/15.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class HalfWaySpringAnimator: NSObject,UIViewControllerAnimatedTransitioning {
//设置动画的持续时间
    var isFrom = false
     init(isFrom:Bool) {
        super.init()
        self.isFrom = isFrom
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    //设置动画的进行方式
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from
        )
        let toVC = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        let fromView = fromVC?.view
        let toView = toVC?.view
        if(isFrom) {
        toView?.frame = CGRect(x:SCREEN_WIDTH, y: 0, width:  SCREEN_WIDTH, height: SCREEN_HEIGHT)
        containerView.addSubview(toView!)
             let transitionDuration = self.transitionDuration(using: transitionContext)
     UIView.animate(withDuration: transitionDuration, animations: {
     toView?.frame = CGRect(x:0, y: 0, width:  SCREEN_WIDTH, height: SCREEN_HEIGHT)
     // 逐渐变为不透明
        toView?.frame = transitionContext.finalFrame(for: toVC!)
     }) { (finish:Bool) in
        let wasCancelled = transitionContext.transitionWasCancelled
        transitionContext.completeTransition(!wasCancelled)
        }
        }else{
            fromView?.frame = CGRect(x:0, y: 0, width:  SCREEN_WIDTH, height: SCREEN_HEIGHT)
            toView?.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
           containerView.addSubview(toView!)
            containerView.addSubview(fromView!)
           // containerView.bringSubview(toFront: fromView!)
            let transitionDuration = self.transitionDuration(using: transitionContext)
            UIView.animate(withDuration: transitionDuration, animations: {
                fromView?.frame = CGRect(x:SCREEN_WIDTH, y: 0, width:  SCREEN_WIDTH, height: SCREEN_HEIGHT)
                // 逐渐变为不透明
                toView?.frame = transitionContext.finalFrame(for: toVC!)
            }) { (finish:Bool) in
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            }

        }
    }
}
