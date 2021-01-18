import { Injectable } from "@nestjs/common";
import { PrismaService } from "nestjs-prisma";
import {
  FindOneImageArgs,
  FindManyImageArgs,
  ImageCreateArgs,
  ImageUpdateArgs,
  ImageDeleteArgs,
  Subset,
} from "@prisma/client";

@Injectable()
export class ImageService {
  constructor(private readonly prisma: PrismaService) {}
  findMany<T extends FindManyImageArgs>(args: Subset<T, FindManyImageArgs>) {
    return this.prisma.image.findMany(args);
  }
  findOne<T extends FindOneImageArgs>(args: Subset<T, FindOneImageArgs>) {
    return this.prisma.image.findOne(args);
  }
  create<T extends ImageCreateArgs>(args: Subset<T, ImageCreateArgs>) {
    return this.prisma.image.create<T>(args);
  }
  update<T extends ImageUpdateArgs>(args: Subset<T, ImageUpdateArgs>) {
    return this.prisma.image.update<T>(args);
  }
  delete<T extends ImageDeleteArgs>(args: Subset<T, ImageDeleteArgs>) {
    return this.prisma.image.delete(args);
  }
}
