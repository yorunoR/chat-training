<template>
  <main style="max-width: 768px; margin: auto">
    <h2>History</h2>
    <section v-if="data" class="text-left mt-6">
      <div
        v-for="answerHistory in data.currentUser.answerHistories"
        class="border-solid border-1 border-300 p-2"
        :key="answerHistory.id"
      >
        <div class="my-2 text-xs">保存日時: {{ answerHistory.createdAt }}</div>
        <div class="my-2">
          <b>質問：</b>
          <span>{{ answerHistory.question }}</span>
        </div>
        <div class="my-2">
          <b>回答：</b>
          <span>{{ answerHistory.answer }}</span>
        </div>
      </div>
    </section>
  </main>
</template>

<script setup lang="ts">
import { useCurrentUserQuery } from '@/auto_generated/graphql'

const { _fetching, _error, data } = useCurrentUserQuery({
  context: { additionalTypenames: ['AnswerHistory'] }
})
</script>
