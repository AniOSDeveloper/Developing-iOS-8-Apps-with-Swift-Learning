//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by WangDa on 12/17/15.
//  Copyright © 2015 dawang. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()
    
    lazy var blockBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedBlockBehavior = UIDynamicItemBehavior();
        lazilyCreatedBlockBehavior.allowsRotation = true
        lazilyCreatedBlockBehavior.elasticity = 0.85
        lazilyCreatedBlockBehavior.friction = 0
        lazilyCreatedBlockBehavior.resistance = 0
        return lazilyCreatedBlockBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(blockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, name: String){
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    
    func addBlock(block: UIView){
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView){
        gravity.removeItem(block)
        collider.removeItem(block)
        blockBehavior.removeItem(block)
        block.removeFromSuperview()
    }
}