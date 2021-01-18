import { ArgsType, Field } from "@nestjs/graphql";
import { ImageWhereInput } from "./ImageWhereInput";

@ArgsType()
class FindManyImageArgs {
  @Field(() => ImageWhereInput, { nullable: true })
  where?: ImageWhereInput;
}

export { FindManyImageArgs };
