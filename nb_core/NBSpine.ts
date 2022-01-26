import * as spine from '@esotericsoftware/spine-canvas';
import NBAssetMgr from './NBAssetMgr';
import NBCanvasRender from './NBCanvasRender';
import NBRenderNode from './NBRenderNode';

export default class NBSpine extends NBRenderNode {
    private _skeletonName: string = '';
    private _skeletonRenderer: spine.SkeletonRenderer;
    private _spSkeleton!: spine.Skeleton;
    public get spSkeleton(): spine.Skeleton {
        return this._spSkeleton;
    }
    private _animationState!: spine.AnimationState;

    constructor(canvas: NBCanvasRender, skeletonName: string) {
        super();
        this._skeletonRenderer = new spine.SkeletonRenderer(canvas.canvasContext);
        this._skeletonName = skeletonName;
    }

    public changeCanvas(canvas: NBCanvasRender) {
        this._skeletonRenderer = new spine.SkeletonRenderer(canvas.canvasContext);
    }

    public draw(canvas: NBCanvasRender, delta: number): void {
        if (this._spSkeleton && this._animationState && this._skeletonRenderer) {
            this._animationState.update(delta);
            this._animationState.apply(this._spSkeleton);
            this._spSkeleton.updateWorldTransform();
            this._skeletonRenderer.draw(this._spSkeleton);
        }
    }

    public readyAnima(): Promise<boolean> {
        return new Promise((resolve, reject) => {
            let jsonKey = this._skeletonName + '.json';
            let atlaskey =
                this._skeletonName.replace('-pro', '').replace('-ess', '') + '.atlas';
            let pngkey =
                this._skeletonName.replace('-pro', '').replace('-ess', '') + '.png';
            if (
                NBAssetMgr.instance.get(jsonKey) &&
                NBAssetMgr.instance.get(atlaskey) &&
                NBAssetMgr.instance.get(pngkey)
            ) {
                resolve(true);
            } else {
                NBAssetMgr.instance.loadTextureAndData(this._skeletonName);
                let func1 = () => {
                    if (NBAssetMgr.instance.isLoadingComplete()) {
                        resolve(true);
                    } else {
                        requestAnimationFrame(func1);
                    }
                };
                // 创建一个异步调用
                requestAnimationFrame(func1);
            }
        });
    }

    public playAnima(
        animaName: string = 'walk',
        isLoop: boolean = true
    ): Promise<number> {
        return new Promise((resolve, reject) => {
            if (this._spSkeleton) {
                this._animationState.setAnimation(0, animaName, isLoop);
                resolve(1);
            } else {
                this.readyAnima().then((val) => {
                    let skeletonData = NBAssetMgr.instance.loadskeletonData(
                        this._skeletonName
                    );
                    this._spSkeleton = new spine.Skeleton(skeletonData);
                    this._animationState = new spine.AnimationState(
                        new spine.AnimationStateData(this._spSkeleton.data)
                    );
                    this._animationState.setAnimation(0, animaName, isLoop);
                    resolve(1);
                });
            }
        });
    }

    private ChangeCloth(slotName: string, texture: spine.CanvasTexture) {
        //获取插槽
        let slot = this._spSkeleton.findSlot(slotName);
        //获取挂件
        let att = slot.attachment as spine.RegionAttachment;
        // 创建region;
        let page = new spine.TextureAtlasPage();
        // page.name = texture.name;
        page.uWrap = spine.TextureWrap.ClampToEdge;
        page.vWrap = spine.TextureWrap.ClampToEdge;
        page.texture = texture;
        page.texture.setWraps(page.uWrap, page.vWrap);
        page.width = texture.getImage().width;
        page.height = texture.getImage().height;
        let region = new spine.TextureAtlasRegion();
        region.page = page;
        region.width = texture.getImage().width;
        region.height = texture.getImage().height;
        region.originalWidth = texture.getImage().width;
        region.originalHeight = texture.getImage().height;
        // (region as spine.RegionAttachment).rotate = false;
        region.u = 0;
        region.v = 0;
        region.u2 = 1;
        region.v2 = 1;

        // 替换region
        // att.width = region.width;
        // att.height = region.height;
        att.region = region;
        att.updateRegion();
    }

    public changeAttackment(
        slotName: string = 'gun',
        imgPath: string = 'http://192.168.10.113:8081/gun_1.png'
    ) {
        let img = new Image();
        img.onload = () => {
            let text = new spine.CanvasTexture(img);
            this.ChangeCloth(slotName, text);
        };
        img.src = imgPath;
    }

    // private calculateBounds(skeleton: spine.Skeleton) {
    //     var data = skeleton.data;
    //     skeleton.setToSetupPose();
    //     skeleton.updateWorldTransform();
    //     var offset = new spine.Vector2();
    //     var size = new spine.Vector2();
    //     skeleton.getBounds(offset, size, []);
    //     return { offset: offset, size: size };
    // }
}
