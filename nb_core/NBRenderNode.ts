import NBCanvasRender from './NBCanvasRender';

export default abstract class NBRenderNode {
    private _zIndex: number = -1;
    public get zIndex(): number {
        return this._zIndex;
    }
    public set zIndex(value: number) {
        this._zIndex = value;
    }

    public abstract draw(canvas: NBCanvasRender, bdelta: number): void;
}
