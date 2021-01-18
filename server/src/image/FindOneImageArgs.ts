import { ArgsType, Field } from "@nestjs/graphql";
import { ImageWhereUniqueInput } from "./ImageWhereUniqueInput";

@ArgsType()
class FindOneImageArgs {
  @Field(() => ImageWhereUniqueInput, { nullable: false })
  where!: ImageWhereUniqueInput;
}

export { FindOneImageArgs };
