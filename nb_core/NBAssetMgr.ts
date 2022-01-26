import * as spine from '@esotericsoftware/spine-canvas';

export default class NBAssetMgr extends spine.AssetManager {
    private static _instance: NBAssetMgr;
    public static get instance(): NBAssetMgr {
        if (!this._instance) {
            this._instance = new NBAssetMgr();
        }
        return NBAssetMgr._instance;
    }

    public static _resPath: string;
    public static set resPath(value: string) {
        this._resPath = value;
    }

    constructor() {
        super(NBAssetMgr._resPath);
    }

    public loadTextureAndData(skelName: string) {
        this.loadText(skelName + '.json');
        this.loadText(skelName.replace('-pro', '').replace('-ess', '') + '.atlas');
        this.loadTexture(skelName.replace('-pro', '').replace('-ess', '') + '.png');
    }

    // 每个spine对象需要自己维护一份skeletonData, 不能共享
    // 因为业务会了换装或者其他对skeletonData修改的需求
    public loadskeletonData(skeletonName: string): spine.SkeletonData {
        let jsonKey = skeletonName + '.json';
        let atlaskey = skeletonName.replace('-pro', '').replace('-ess', '') + '.atlas';
        let atlas = new spine.TextureAtlas(this.require(atlaskey));
        atlas.setTextures(this);
        let atlasLoader = new spine.AtlasAttachmentLoader(atlas);
        let skeletonJson = new spine.SkeletonJson(atlasLoader);

        let skeletonData = skeletonJson.readSkeletonData(this.require(jsonKey));

        return skeletonData;
    }
}
