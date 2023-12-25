import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/customWidget/customPage.dart';

import '../../common/style.dart';
import '../../customWidget/optionsList.dart';
import 'logic.dart';

class WorkPlacePage extends StatelessWidget {
  final logic = Get.put(WorkPlaceLogic());
  final state = Get.find<WorkPlaceLogic>().state;

  WorkPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: '答题模式',
      child: Column(
        children: [
          progressBar(context),
          Obx(
            () => workPlace(context),
          ),
          detail(context),
          const Divider(color: Colors.grey, thickness: 2),
        ],
      ),
    );
  }

  Widget progressBar(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width *
              state.finish.value /
              state.all.value,
          color: Colors.lightGreen,
        ),
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width *
              (1 - state.finish.value / state.all.value),
          color: Colors.black12,
        ),
      ],
    );
  }

  Widget workPlace(BuildContext context) {
    List<CustomOptionCard> cards = [
      CustomOptionCard(
        activate: state.activates[0].value,
        activateColor: Colors.green,
        onTap: () => {state.activates[0].value = !state.activates[0].value},
      ),
      CustomOptionCard(
        activate: state.activates[1].value,
        activateColor: Colors.green,
        onTap: () => {state.activates[1].value = !state.activates[1].value},
      ),
      CustomOptionCard(
        activate: state.activates[2].value,
        activateColor: Colors.green,
        onTap: () => {state.activates[2].value = !state.activates[2].value},
      ),
      CustomOptionCard(
        activate: state.activates[3].value,
        activateColor: Colors.green,
        onTap: () => {state.activates[3].value = !state.activates[3].value},
      ),
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  state.questionDateIsEmpty.value
                      ? '.....'
                      : state.questions[state.index].question_text,
                  style: TextStyles.commonTextStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: OptionList(
              cards: cards,
            ),
          )
        ],
      ),
    );
  }

  Widget info(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            state.title,
            style: TextStyles.commonTextStyle,
          ),
          Text(
            state.t,
            style: TextStyles.commonTextStyle,
          )
        ],
      ),
    );
  }

  Widget answer(BuildContext context) {
    return Container();
  }

  Widget detail(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            state.detail[0],
            style: TextStyles.commonTextStyle,
          ),
          Text(
            state.detail[0],
            style: TextStyles.commonTextStyle,
          ),
          Text(
            state.detail[0],
            style: TextStyles.commonTextStyle,
          ),
          Text(
            state.detail[0],
            style: TextStyles.commonTextStyle,
          ),
        ],
      ),
    );
  }
}
