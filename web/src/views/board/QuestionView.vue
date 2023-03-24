<template>
  <main style="max-width: 768px; margin: auto">
    <h2>Question</h2>
    <section>
      <div class="text-left mt-6">
        <p><b>質問を入力してください</b></p>
      </div>
      <Textarea v-model="question" class="w-full p-3" :disabled="answer != null" />
      <Button
        class="w-full mt-3"
        label="Submit"
        :disabled="question === '' || answer != null"
        @click="clickSendQuestion"
      />
    </section>
    <hr class="my-5" />
    <section v-if="answer != null" class="text-left">
      <div>
        <p><b>回答</b></p>
      </div>
      <p class="border-solid border-1 border-400 p-3" style="white-space: pre-wrap">
        {{ answer }}
      </p>
      <Button class="w-full mt-3" label="Save and Clear" @click="clickSaveAnswer" />
      <Button class="w-full mt-2" label="Clear" @click="clear" />
    </section>
    <Dialog v-model:visible="visible" modal :closable="false" :style="{ width: '30vw' }">
      <div class="text-center pb-3">
        <b>問い合わせ中です</b>
      </div>
    </Dialog>
  </main>
</template>

<script setup lang="ts">
import { useToast } from 'primevue/usetoast'
import { ref } from 'vue'
import { useSendQuestionMutation } from '@/auto_generated/graphql'
import { useSaveAnswerMutation } from '@/auto_generated/graphql'

const toast = useToast()

const question = ref('')
const answer = ref(null)
const visible = ref(false)

const { executeMutation: sendQuestion } = useSendQuestionMutation()
const { executeMutation: saveAnswer } = useSaveAnswerMutation()

const clickSendQuestion = async () => {
  visible.value = true
  const res = await sendQuestion({
    question: question.value
  })
  visible.value = false
  answer.value = res?.data?.sendQuestion?.answer
}

const clickSaveAnswer = async () => {
  const res = await saveAnswer({
    question: question.value,
    answer: answer.value
  })
  if (res.error) {
    toast.add({
      severity: 'error',
      summary: 'Save Answer',
      detail: res.error.message
    })
  } else {
    toast.add({
      severity: 'success',
      summary: 'Save Answer',
      detail: 'History のページで確認できます'
    })
  }
  clear()
}

const clear = () => {
  question.value = ''
  answer.value = null
}
</script>
